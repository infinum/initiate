module SuspendersTestHelpers
  APP_NAME = "dummy_app"

  def remove_project_directory
    FileUtils.rm_rf(project_path)
  end

  def create_tmp_directory
    FileUtils.mkdir_p(tmp_path)
  end

  def run_suspenders(arguments = nil)
    Dir.chdir(tmp_path) do
      Bundler.with_clean_env do
        ENV['TESTING'] = '1'
        ENV['SECRET_KEY_BASE'] = '3b9ed53546e0f1bc9b45694b82143e6e4079543d77yy55wd5f7ccdd162a0382ZeD50dfeb40c21ada7b69808eb1faa900cdc4d523e6752348283a6558030122a6'
        ENV['BUGSNAG_API_KEY'] = '6b5ab9ff1c7ba4eea039f5d4dd497c8e'

        `#{suspenders_bin} #{APP_NAME} #{arguments}`
      end
    end
  end

  def drop_dummy_database
    if File.exist?(project_path)
      Dir.chdir(project_path) do
        Bundler.with_clean_env do
          `rake db:drop`
        end
      end
    end
  end

  def project_path
    @project_path ||= Pathname.new("#{tmp_path}/#{APP_NAME}")
  end

  private

  def tmp_path
    @tmp_path ||= Pathname.new("#{root_path}/tmp")
  end

  def suspenders_bin
    File.join(root_path, 'bin', 'suspenders')
  end

  def root_path
    File.expand_path('../../../', __FILE__)
  end
end
