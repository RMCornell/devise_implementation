$(document).ready(function(){
    /*
     * shuffles the array
     * @param {Array} myArray array to shuffle
     */
    function shuffleArray(myArray) {
        for (var i = myArray.length - 1; i > 0; i--) {
            var j = Math.floor(Math.random() * (i + 1));
            var temp = myArray[i];
            myArray[i] = myArray[j];
            myArray[j] = temp;
        }
        return myArray;
    }

    var $ul, $li, li_content, li_list;
    // find all lists to shuffle
    $("#feed > ul").each(function() {
        $ul = $(this);
        li_list = [];
        // shuffle only elements that don't have "group" class
        $ul.find("li[class!='group']").each(function() {
            // add content to the array and remove item from the DOM
            li_list.push($(this).html());
            $(this).remove();
        });

        // shuffle the list
        li_list = shuffleArray(li_list);
        while(li_content = li_list.pop()) {
            // create <li> element and put it back to the DOM
            $li = $("<li />").html(li_content);
            $ul.append($li);
        }
    });

    $("#feed").show();
});