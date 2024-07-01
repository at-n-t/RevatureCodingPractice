({
   add : function(cmp, evt) {
        var messageList = [];
        var message = evt.getParam('message');
        messageList.push(message);
        cmp.set('v.stringList', messageList);
    }
})