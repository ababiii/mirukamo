<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html lang="en">
<head>
<meta id="viewport" name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<title> Stu Nicholls | CSS PLAY | Video playlist - A video playlist for PCs, tablets and smartphones including IE7+ </title>
<style>
#info .cssplayPlaylist {display:block; width:640px; position:relative; margin:0 auto;}
#info .playlistHolder {width:640px; margin:10px auto; height:100px;}
#info .playlist {cursor:pointer; width:120px; margin:0 10px 0 0; float:left; padding:0; font:400 12px/15px 'latomedium', 'verdana', sans-serif; color:#666; text-transform:uppercase; text-align:center;}
#info .playlist img {opacity:0.5; filter: alpha(opacity=50);}
#info .playlist:hover img {opacity:1; filter: alpha(opacity=100);}
#info .playlist.lastchild {margin:0;}
#info .playlist.chosen {color:#000;}
#info .playlist.chosen img {opacity:1; filter: alpha(opacity=100);}
#info .posterImage {position:absolute; width:100%; height:100%; left:0; top:0; background-position:center center; background-size:cover; z-index:100;}
#info .play {display:block; margin:auto; cursor:pointer;}
</style>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="../resources/playlist_css/cssplay-playlist-min.js"></script>
<style>
	@media only screen and (max-width:480px) {
	.cssplayPlaylist {display:none;}
	.playlistHolder {display:none;}
	#info h3.smartphone {display:block;}
	}
</style>
</head>
<body>
<div id="info">
<div class="cssplayPlaylist">
<video id="movie" width="640" height="360" controls="true" preload="true" poster="posters/despicable.jpg" controls autoplay>
	<source src="../resources/videos/2.mp4" type='video/mp4; codecs="avc1.42E01E, mp4a.40.2"' />
</video>
</div>
<div class="playlistHolder">
	<p class="playlist chosen" data-id="#movie" data-video="../resources/videos/2" data-poster="../resources/posters/despicable.jpg"><img src="../resources/posters/despicablet.jpg" alt=""><br>Despicable Me 2</p>
	<p class="playlist" data-id="#movie" data-video="../resources/videos/3" data-poster="../resources/posters/turbo2.jpg"><img src="../resources/posters/turbo2t.jpg" alt=""><br>Turbo</p>
	<p class="playlist" data-id="#movie" data-video="../resources/videos/2" data-poster="../resources/posters/smurfs.jpg"><img src="../resources/posters/smurfst.jpg" alt=""><br>The Smurfs 2</p>
	<p class="playlist" data-id="#movie" data-video="../resources/videos/2" data-poster="../resources/posters/planes.jpg"><img src="../resources/posters/planest.jpg" alt=""><br>Planes</p>
	<p class="playlist lastchild" data-id="#movie" data-video="../resources/videos/2" data-poster="../resources/posters/monster.jpg"><img src="../resources/posters/monstert.jpg" alt=""><br>Monster University</p>
</div>
</body>
</html>

