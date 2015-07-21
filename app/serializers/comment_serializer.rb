class CommentSerializer < ActiveModel::Serializer
	
	attributes :id, :section, :user_id, :body, :body_html, :created_at_clean, :created_at, :updated_at

	has_one :author,key: :author_id

	def created_at_clean

		object.created_at.strftime('%A, %b %-d, %Y, %l:%M %p')

	end

	def body_html

		if object.body

			object.body.to_s.gsub(/\n/,'<br>')

		else

			object.body

		end

	end

end