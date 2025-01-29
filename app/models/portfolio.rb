class Portfolio < ApplicationRecord
  require "rqrcode"

  BASE_URL = "https://olenx-platforms-api.onrender.com/api/v1" if Rails.env.production?
  BASE_URL = "http://localhost:3000/api/v1" if Rails.env.development?

  has_one_attached :avatar
  has_one_attached :qr_code

  belongs_to :user

  has_many :projects
  has_many :ideas

  after_create :create_my_qr_code

  def create_my_qr_code
    qr = RQRCode::QRCode.new("#{BASE_URL}portfolios/#{self.id}")
    png = qr.as_png(
      bit_depth: 1,
      border_modules: 2,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120
    )
    # attach the png to the portfolio as qr_code by cloudinary
    self.qr_code.attach(
      io: StringIO.new(png.to_s),
      filename: "qr_code_portfolio_#{self.id}.png",
      content_type: "image/png",
      metadata: {
        title: "QR code for portfolio #{self.id}",
        alt: "QR code for portfolio #{self.id}"
      }
    )
  end
end
