WickedPdf.config = {
	if Rails.env.staging? || Rails.env.production?
  	exe_path = Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s
  	layout: "application.pdf.erb",
	else
  	exe_path = Rails.root.join('bin', 'wkhtmltopdf').to_s
    layout: "application.pdf.erb",
    #exe_path: 'C:\Program Files\wkhtmltopdf\bin\wkhtmltopdf.exe'
end
}
