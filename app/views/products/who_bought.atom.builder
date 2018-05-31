atom_feed do |feed|
  feed.title "Who bought #{@product.title}"
  
  feed.updated @latest_order.try(:updated_at)
  
  @product.orders.each do |order|
    feed.entry(order) do |entry|
      entry.title "Order #{order.id}"
      entry.summary type: "xhtml" do |xhtml|
        xhtml.p "Shipped to #{order.address}"
        
        xhtml.table do
          xhtml.tr do
            xhtml.th "Product"
            xhtml.th "Quantity"
            xhtml.th "Total Price"
          end
        end
      end
    end
  end
end