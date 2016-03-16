var NEWS_MAX = 5; //number of the news to be listed

//chars to be used in any methods
function DEFINE_CHAR()
{
	this.SPLIT = ' ';
	this.JOIN = ',';
}
var CHAR = new DEFINE_CHAR();

function DEFINE_COLOR()
{
	this.FONT_DEFAULT = "#000000";
	this.FONT_HIGHLIGHT = "#ff8000";
}
var COLOR = new DEFINE_COLOR();

//classes / ids
function DEFINE_IDENT()
{
	this.CLOSE = ".close";
	this.NAVIGATE = "#navbar";
	this.NAVIGATE_TABS = this.NAVIGATE + " tr";
	this.NAVIGATE_TAB_LINK = this.NAVIGATE + " tr td a";
	this.NEWS = "#news";
	this.NEWS_LIST = this.NEWS + " .content";
	this.NEWS_TITLE = ".news_title";
	this.NEWS_MORE = "#news_more";
	this.NEWS_DETAIL = "#news_detail";
}
var IDENT = new DEFINE_IDENT();
/*
//file's name
function DEFINE_PAGE()
{
	this.INDEX = "index.html";
	this.RESEARCH = "research.html";
	this.MEMBER = "members.html";
	this.LECTURE = "lectures.html";
	this.PROFILE = "profile.html";
	this.ACCESS = "access.html";
	this.TOYOSUDAY = "toyosuday.html";
}
var PAGE = new DEFINE_PAGE();
*/
$(document).ready(function()
{
	//LIST NEWS
	var title = "<ul>";
	var detail = "<div id=\"news_detail\" style=\"display:none;\"><div class=\"close\">**&nbsp;ここをクリックすると詳細を閉じます。&nbsp;**</div>";
	for (var i = 0; i < NEWS_TITLE.length && i < NEWS_MAX; i++)
	{
		/* CHECK UPDATED TIME OF THE NEWS TO PUT A MARK LIKES "NEW!"
		var update = Date.parse(NEWS_TITLE[i][0]);
		var limit = 14;
		limit *= 24 * 60 * 60 * 1000;
		var today = new Date();
		var now = today.getTime();
		if (update + limit < now) console.log("old");
		else console.log("new");
		*/
		if (NEWS_DETAIL[i].indexOf("<DL>") != -1)
		{
			NEWS_DETAIL[i] = NEWS_DETAIL[i].replace("<DL>", "");
			//includes linker
			title += "<li><a id=\"t_" + i.toString() + "\" class=\"" + NEWS_TITLE[i][1] + "\" href=\"" + NEWS_DETAIL[i] + "\" target=\"_blank\">" + NEWS_TITLE[i][2] + "</a></li>";
		}
		else
		{
			title += "<li><a id=\"t_" + i.toString() + "\" class=\"news_title\">" + NEWS_TITLE[i][2] + "</a></li>";
			detail += "<div id=\"d_" + i.toString() + "\" style=\"display: none;\"><h1>" + NEWS_TITLE[i][2] + "</h1>" + NEWS_DETAIL[i] + "</div>";
		}
	}
	title += "</ul>";
	if (NEWS_TITLE.length > NEWS_MAX) title += "<div id=\"news_more\"><a>>>&nbsp;以前のニュースを表示する</a></div>";
	detail += "</div>";
	$(IDENT.NEWS_LIST).append(title);
	$("body").append(detail);

	//NEWS_MORE
	$(IDENT.NEWS_MORE).click(function()
	{
		$(this).remove();
		var title = "";
		var detail = "";
		for (var i = NEWS_MAX; i < NEWS_TITLE.length; i++)
		{
			/* CHECK UPDATED TIME OF THE NEWS TO PUT A MARK LIKES "NEW!"
			var update = Date.parse(NEWS_TITLE[i][0]);
			var limit = 14;
			limit *= 24 * 60 * 60 * 1000;
			var today = new Date();
			var now = today.getTime();
			if (update + limit < now) console.log("old");
			else console.log("new");
			*/
			if (NEWS_DETAIL[i].indexOf("<DL>") != -1)
			{
				NEWS_DETAIL[i] = NEWS_DETAIL[i].replace("<DL>", "");
				//includes linker
				title += "<li><a id=\"t_" + i.toString() + "\" class=\"" + NEWS_TITLE[i][1] + "\" href=\"" + NEWS_DETAIL[i] + "\" target=\"_blank\">" + NEWS_TITLE[i][2] + "</a></li>";
			}
			else
			{
				title += "<li><a id=\"t_" + i.toString() + "\" class=\"news_title\">" + NEWS_TITLE[i][2] + "</a></li>";
				detail += "<div id=\"d_" + i.toString() + "\" style=\"display: none;\"><h1>" + NEWS_TITLE[i][2] + "</h1>" + NEWS_DETAIL[i] + "</div>";
			}
		}
		title += "";
		detail += "";
		$(IDENT.NEWS_LIST + " ul").append(title);
		$(IDENT.NEWS_DETAIL).append(detail);
	});

	//SHOW NEWS DETAILS
	$("*").on("click", IDENT.NEWS_TITLE, function()
	{
		$("body").css("overflow", "hidden");
		$(IDENT.NEWS_DETAIL + " div").css("display", "none");
		$(IDENT.NEWS_DETAIL + " .close").css("display", "block");
		var detail = "#" + this.id.replace("t_", "d_");
		var wwidth = window.innerWidth ? window.innerWidth: $(window).width();
		var wheight = window.innerHeight ? window.innerHeight: $(window).height();
		var width = Math.floor(wwidth * 0.85);
		if (width > 1020) width = 1020;
		var height = Math.floor(wheight * 0.7);
		if (height > 500) height = 500;
		var left = Math.floor((wwidth - width) / 2);
		var top = Math.floor((wheight - height) / 2) - $(IDENT.NEWS_DETAIL + " .close").get(0).offsetHeight;
		$(IDENT.NEWS_DETAIL).css("width", wwidth.toString() + "px").css("height", "100%");
		$(detail).css("margin-left", left.toString() + "px").css("margin-top", top.toString() + "px");
		$(detail).css("width", width.toString() + "px").css("height", height.toString() + "px");
		if ($(IDENT.NEWS_DETAIL).css("display") == "none") $(IDENT.NEWS_DETAIL).slideDown("slow");
		$(detail).css("display", "block");
	});

	//HIDE NEWS DETAILS
	$("*").on("click", IDENT.NEWS_DETAIL + " .close", function()
	{
		$(this).parent().slideUp("normal");
		$("body").css("overflow", "scroll");
	});

});
