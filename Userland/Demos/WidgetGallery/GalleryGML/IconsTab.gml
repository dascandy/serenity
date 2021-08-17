@GUI::Widget {
    name: "icons_tab"
    layout: @GUI::VerticalBoxLayout {
        margins: [4]
    }

    @GUI::GroupBox {
        layout: @GUI::VerticalBoxLayout {
            margins: [8]
        }

        @GUI::TableView {
            name: "icons_tableview"
            font_size: 12
        }
    }
}
