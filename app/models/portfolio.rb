class Portfolio < ApplicationRecord
  require 'rqrcode'

  has_one_attached :avatar
  has_one_attached :qr_code

  belongs_to :user

  has_many :projects
  has_many :ideas

  after_create :create_my_qr_code

  def create_my_qr_code
    qr = RQRCode::QRCode.new("http://localhost:3000/portfolios/#{self.id}")
    svg = qr.as_svg(
      offset: 4,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 11,
      standalone: true,
      use_path: true
    )
    # attach the svg to the portfolio as qr_code by cloudinary
    self.qr_code.attach(
      io: StringIO.new(svg),
      filename: "qr_code_portfolio_#{self.id}.svg",
      content_type: 'image/svg+xml',
      metadata: {
        title: "QR code for portfolio #{self.id}",
        alt: "QR code for portfolio #{self.id}"
      }
    )
  end

end
