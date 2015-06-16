class AjsGenerator < Rails::Generators::Base
  
  source_root File.expand_path('../templates', __FILE__)

  argument :layout_name,type: :string,required: true
  argument :detail,type: :string,required: false

  def generate_ctrl

  	template 'template.html',"app/views/angularjs/#{file_name}.html.erb"
  	template 'ctrl.js',"app/assets/javascripts/AngularCTRL/Application/#{name.capitalize}/#{file_name}.js"
    template 'style.css',"app/assets/stylesheets/Application/#{name.capitalize}/#{file_name}.css.erb"

  	s1 = ",'#{file_name}'"
  	insert_into_file 'app/controllers/angularjs_controller.rb',s1,after: "list = ['blank'"

  	s1 = <<-ZTEXT
  	\n\t.when('/#{v_name}',{

		templateUrl : '/angularjs/templates/#{file_name}.html',
		controller: #{cap_name}Ctrl

	})
	ZTEXT
  	insert_into_file 'app/assets/javascripts/AngularCTRL/Application/main.js',s1,after: "/* MARKER */"

  end

  private

  def file_name

  	final = "#{layout_name}"

  	final << "_#{detail}" if detail

  	final

  end

  def v_name

  	final = "#{layout_name}"

  	final << "/:id" if detail == 'show'
    final << "/:id/edit" if detail == 'edit'

  	final

  end

  def cap_name

  	final = "#{layout_name.capitalize}"

  	final = "#{layout_name.capitalize}#{detail.capitalize}" if detail

  	final

  end

  def name

  	layout_name

  end

end