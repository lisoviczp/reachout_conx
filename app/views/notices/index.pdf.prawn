@current_notices.each do |notice|
	pdf.text "#{notice.apartment.apartment_name if notice.apartment}", size: 15, style: :bold
	pdf.text "#{notice.notice_type}", style: :bold
	pdf.text "Tenant: #{notice.tenant.full_name if notice.tenant}", style: :bold
	pdf.text "Landlord: #{notice.landlord.full_name if notice.landlord}", style: :bold
	pdf.text "Subject: #{notice.title}"
	pdf.move_down(2)
	pdf.text "#{notice.body}"
	pdf.move_down(5)
	pdf.text "#{notice.created_at}", size: 8
	pdf.move_down(30)
end
