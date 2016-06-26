issue_view = {
    issue_id: 0,
    list_link_text: 'Issue views list',
    list_title: 'Issue views list',

    init: function(){
        if (this.issue_id != 0)
            this.add_contextual_button();
    },

    add_contextual_button: function(){
        self = this;
        $('#content .contextual:first').append(self.create_contextual_button());
    },

    create_contextual_button: function(){
        var self = this;
        return $('<a>')
            .attr({
                href: self.list_uri(),
                class: 'issue_views_button',
                onclick: 'issue_view.show_list(); return false;'
            })
            .text(self.list_link_text);
    },

    list_uri: function(){
        return '/issues/' + self.issue_id + '/views';
    },

    show_list: function(){
        self = this;
        $.get(issue_view.list_uri()).success(function(data){
            $(data).dialog({
                title: self.list_title,
                maxHeight: 600,
                resizable: true
            });
        })
    }


};
