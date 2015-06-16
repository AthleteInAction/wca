class ApiGenerator < Rails::Generators::Base

  source_root File.expand_path('../templates', __FILE__)

  argument :controller_name,type: :string,required: true
  argument :api_version,type: :string,default: '1'

  def generate

  	template 'controller.rb',"app/controllers/api/v#{version}/#{name}_controller.rb"
  	template 'factory.js',"app/assets/javascripts/AngularAPI/v#{version}/Factories/api_model.js"
  	template 'service.js',"app/assets/javascripts/AngularAPI/v#{version}/Services/#{name}.js"

  	routes_path = 'config/routes.rb'

  	api = "\n\t\t\tresources :#{name},path: '#{name}s'"
  	insert_into_file routes_path,api,after: "# API INSERT"

  	s1 = "\n\tthis.#{name}s = #{name.capitalize}SVC.#{name}s;"
  	insert_into_file 'app/assets/javascripts/AngularAPI/service.js',s1,after: "// INSERT HERE"

    ss2 = ",'#{name.capitalize}Module'"
    insert_into_file 'app/assets/javascripts/AngularAPI/service.js',ss2,after: "['BlankModule'"

  	s2 = ",'#{name.capitalize}SVC'"
  	insert_into_file 'app/assets/javascripts/AngularAPI/service.js',s2,after: "['BlankSVC'"

  	s3 = ",#{name.capitalize}SVC"
  	insert_into_file 'app/assets/javascripts/AngularAPI/service.js',s3,after: "(BlankSVC"

  end

  private

  def name

  	controller_name

  end

  def version

  	api_version

  end

end