require "yaml"
require "ostruct"

module YamlLoader

  def base_dir(path = nil)
    if path
      @base_dir = path
    else  
      @base_dir
    end
  end

  def get(id)
    find(File.join(base_dir, id.to_s))
  end

  def find(path)
    new(load(path))
  end

  def all
    Dir[File.join(base_dir, "**/*.yaml")].map {|path| find(path) }
  end

  def load(path)
    path = path + ".yaml" if File.extname(path).empty?
    YAML.load_file(path)
  end

end
