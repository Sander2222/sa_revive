$(function () {
    function display(bool) {
        if (bool) {
            $("body").show();
        } else {
            $("body").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })

    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('https://sa_revive/exit', JSON.stringify({}));
            return
        }
    };

    $("#btn").click(function(e) {
		$.post('https://sa_revive/register', JSON.stringify({
			PlayerID: $("#inputfield").val()
		}));
	});
});

function sendid() {
    console.log("Hallo");
    $.post('https://sa_revive/register', JSON.stringify({
        PID: $("#inputfield").val()
    }));
}