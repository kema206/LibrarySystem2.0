<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp" %>
<!DOCTYPE "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Selected Book</title>
<%
    String isbn = request.getParameter("isbn");
%>
<style>
    .text-c {
		text-align: center;
	}
</style>
<script type="text/javascript" src="https://www.google.com/books/jsapi.js"></script>
    <script type="text/javascript">
      google.books.load();
      function initialize() {
        var viewer = new google.books.DefaultViewer(document.getElementById('viewerCanvas'));
        viewer.load('ISBN:'.concat(<%=isbn%>));
      }

      google.books.setOnLoadCallback(initialize);
    </script>
</head> 
<body style="background-color:#FFFDD0">
<div class = "text-c">
<h2>Book Preview</h2>
</div>
<br>
<div id="viewerCanvas" style="width: 1000px; height: 500px"></div>
<br>
<div class = "text-c">
<h2>Tweets Corresponding to Book</h2>
<script type="text/javascript">
    if(<%=isbn%>=="9781649360298"){
        document.wtite('<blockquote class=\""twitter-tweet\""><p lang="\"en\"" dir="\"ltr\"">Find us and our books at <a href="\"https://twitter.com/ThoughtBubbleUK?ref_src=twsrc%5Etfw\"">@ThoughtBubbleUK</a> this weekend! Redshirt Hall table no. 56<br><br>Peter and Maria Hoey Bring Animal Stories and Bend of Luck to TBubs <a href="\"https://t.co/i4kNRHIrw5\"">https://t.co/i4kNRHIrw5</a> via <a href="\"https://twitter.com/bleedingcool?ref_src=twsrc%5Etfw\"">@bleedingcool</a> <a href="\"https://t.co/upAWeTgUkY\"">pic.twitter.com/upAWeTgUkY</a></p>&mdash; Peter &amp; Maria Hoey (@CoinOpBooks) <a href="\"https://twitter.com/CoinOpBooks/status/1591040484012855299?ref_src=twsrc%5Etfw\"">November 11, 2022</a></blockquote> <script async src="\"https://platform.twitter.com/widgets.js\"" charset="\"utf-8\""></script>');
    
    }
    </script>
    <script type="text/javascript">
    else if(<%=isbn%>=="9781684067886"){
        temp = 'ISBN:9781684067886';
    }else if(<%=isbn%>=="9781684069897"){
        temp = 'ISBN:9781684069897';
    }else if(<%=isbn%>=="9781603091190"){
        temp = 'ISBN:9781603091190';
    }else if(<%=isbn%>=="9780451499103"){
        temp = 'ISBN:9780451499103';
    }else if(<%=isbn%>=="9780525518365"){
        temp = 'ISBN:9780525518365';
    }else if(<%=isbn%>=="9780814779965"){
        temp = 'ISBN:9780814779965';
    }else if(<%=isbn%>=="9781338048179"){
        temp = 'ISBN:9781338048179';
    }else if(<%=isbn%>=="9780826496744"){
        temp = 'ISBN:9780826496744';
    }else if(<%=isbn%>=="9788193540190"){
        temp = 'ISBN:9788193540190';
    }else if(<%=isbn%>=="9780545103770"){
        temp = 'ISBN:9780545103770';
    }
    </script>
</div>

</body>