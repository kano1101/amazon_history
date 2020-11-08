# coding: utf-8
require 'csv'
class CsvWriter
  def self.generate_report

    items = AmazonBrowser.login_and_batch_scrape
    CSV.open('purchase_items.csv', 'w') do |csv|
      csv << ["購入日", "金額", "商品名", "商品URL"]
      items.each do |item|
        csv << [item["purchased_at"], item["price"], item["name"], item["url"]]
      end
    end
  end
end
