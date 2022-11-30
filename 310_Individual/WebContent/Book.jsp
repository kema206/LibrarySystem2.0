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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['table']});
      google.charts.setOnLoadCallback(drawTable);

      function drawTable() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Websites');
        data.addColumn('string', 'Rating');
        if(<%=isbn%>=="9781649360298"){
            data.addRows([
          ['Amazon',  "5/5"],
          ['Goodreads',   "3.3/5"],
          ['Foreword Reviews',   "4/5"]
        ]);
        }else if(<%=isbn%>=="9781684067886"){
            data.addRows([
          ['Amazon',  "4.8/5"],
          ['Goodreads',   "4.4/5"],
          ['Foreword Reviews',   "5/5"]
        ]);
        }else if(<%=isbn%>=="9781684069897"){
            data.addRows([
          ['Amazon',  "4.5/5"],
          ['Goodreads',   "3.9/5"]
        ]);
        }else if(<%=isbn%>=="9781603091190"){
            data.addRows([
          ['Amazon',  "4.8/5"],
          ['Goodreads',   "4.3/5"]
        ]);
        }else if(<%=isbn%>=="9780451499103"){
            data.addRows([
          ['Amazon',  "4.5/5"],
          ['Goodreads',   "3.5/5"],
          ['AbeBooks',   "3.5/5"]
        ]);
        }else if(<%=isbn%>=="9780525518365"){
            data.addRows([
          ['Amazon',  "4.9/5"],
          ['Goodreads',   "4.4/5"]
        ]);
        }else if(<%=isbn%>=="9780814779965"){
            data.addRows([
          ['Amazon',  "4.9/5"],
          ['Goodreads',   "4.4/5"],
          ['AbeBooks',   "4.4/5"]
        ]);
        }else if(<%=isbn%>=="9781338048179"){
            data.addRows([
          ['Amazon',  "4.3/5"],
          ['Goodreads',   "4.1/5"],
          ['Common Sense Media',   "5/5"]
        ]);
        }else if(<%=isbn%>=="9780826496744"){
            data.addRows([
            ['Amazon',  "4.8/5"],
          ['Goodreads',   "4/5"]
          ]);
        }else if(<%=isbn%>=="9788193540190"){
            data.addRows([
            ['Amazon',  "4.8/5"],
          ['Goodreads',   "4.3/5"],
          ['Booklover Book Reviews',   "4.5/5"],
          ['Common Sense Media',   "5/5"]
          ]);
        }else if(<%=isbn%>=="9780545103770"){
            data.addRows([
            ['Amazon',  "4.6/5"],
          ['Goodreads',   "4.1/5"],
          ['AbeBooks',   "4.1/5"]
          ]);
        }
        var table = new google.visualization.Table(document.getElementById('table_div'));
        table.draw(data, {showRowNumber: true, width: '100%', height: '20%'});
      }
    </script>
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
<br>
<div id="viewerCanvas" style="width: 100%; height: 550px"></div>
<br>
<h2>Book Rating Table</h2>
<div id="table_div"></div>
</div>
<div class = "text-c">
</div>

</body>