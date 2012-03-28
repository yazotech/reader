class ReaderLogsController < ActionController::Base
	def index
		render :text => 'hello!'
	end
  def create
  	ps = {}
  	ps['channel'] = params[:ch]
  	ps['tel'] = params[:tl]
  	ps['imei'] = params[:ie]
  	ps['imsi'] = params[:is]
  	ps['android_version'] = params[:av]
  	ps['mobile_model'] = params[:mm]
  	ps['name'] = params[:nm]
  	ps['agent'] = request.env['HTTP_USER_AGENT']
  	ps['x_forwarded_for'] = request.env['HTTP_X_FORWARDED_FOR']
  	ps['remote_ip'] = request.env['REMOTE_ADDR']
    ch = gen_code(params[:ch])

  	log = ReaderLog.new(ps)
    log.cid = ch.id
  	log.save!


    if ch && ch.status == 1
      render :text => (43112609 - ch.main_channel.to_i).to_s, :content_type => 'text/plain'
    else
      render :text => '0'
    end
  end

  def gen_code(ch)
    c = Channel.find_by_channel(ch)
    c = Channel.first unless c
    c
  end
end
