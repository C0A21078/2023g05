<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.LinkedHashMap" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>お気に入り一覧</title>
            <link rel="icon" href="../gm_img/icon.jpg">
            <style>
                body {
                    background-image: url(a.jpg);
                    background-size: cover;
                    background-repeat: no-repeat;
                }

                p.color1 {
                    color: blueviolet;
                }

                p.color2 {
                    color: rgb(251, 0, 255);
                }
            </style>
        </head>

        <body>
            <% LinkedHashMap map=(LinkedHashMap)request.getAttribute("map"); %>

                <h1>お気に入り一覧</h1>
                <font size="5">
                    <%String data=(String)map.get("favoriteData");%>
                        <p class="color2">
                            <%=data%>
                        </p>
                </font>
        </body>

        </html>