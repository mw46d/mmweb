class AdminController < ApplicationController
  LOG_FILE = Rails.root.join('support/mw.log')

  def progress
    @pid = params[:pid].to_i
    @log = File.open(LOG_FILE, 'r') do |file|
      file.read()
    end
    @running = begin
      Process.kill 0, @pid
      true
    rescue Errno::EPERM
      # Not out pid
      false
    rescue Errno::ESRCH
      # No such process
      false
    end

    if request.xhr?
      html = render_to_string :partial => "progress.html.erb"
      render :json => { :flash => "Saved", :html => html }.to_json
      return
    end
  end

  def upload
    if request.post?
      if params[:pin].to_i == 170898
        uploaded_io = params[:backup]
        name = File.basename(uploaded_io.original_filename)
        File.open(Rails.root.join('support', name), 'wb') do |file|
          file.write(uploaded_io.read)
        end

        @pid = fork do
          exec "cd #{Rails.root.join('support')}; ./mw.do \"#{name}\" >#{LOG_FILE} 2>&1"
        end

        Process.detach(@pid)

        redirect_to :action => 'progress', :pid => @pid
        return
      end
    end    
  end
end
