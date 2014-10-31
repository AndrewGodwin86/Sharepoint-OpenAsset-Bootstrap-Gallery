<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:openAsset="http://openasset.axomic.com/OpenAsset/XML" version="1.0">
<xsl:template match="/">
 <xsl:apply-templates select="rss/channel"/> 
</xsl:template>

<xsl:template match="channel"> 
	<!-- Carousel styles -->
	<link href="/SiteCollectionDocuments/carouselStyles.css" rel="stylesheet"/>
	<style>div#smCarousel{width:252px;} .carousel-inner {text-align:center;} .carousel-inner > .item > img {height:158px; width:auto; margin:0 auto;} div#smCarousel .carousel-caption {padding:5px 15px;} div#smCarousel .carousel-control {left:0px;} div#smCarousel .carousel-control.right{right:0px;left:auto;} div.carousel-caption {text-align:left;} div.carousel-caption a {color:white !important;} div.carousel-caption a:hover {color:#ef3125 !important;} .carousel-inner img {border-width:0px; height:158px; width:auto !important; margin:0 auto;}</style> 
	<!-- Start carousel setup. Set width to overwrite bootsrap default width -->
	 <div class="carousel slide" id="smCarousel">
	 	<ol class="carousel-indicators">
	 		<li class="active" data-slide-to="0" data-target="#smCarousel"/>
	 		<li data-slide-to="1" data-target="#smCarousel"/>
	 		<li data-slide-to="2" data-target="#smCarousel"/>
	 		<li data-slide-to="3" data-target="#smCarousel"/>
	 		<li data-slide-to="4" data-target="#smCarousel"/>
	 	</ol>
	 	<div class="carousel-inner"> <xsl:apply-templates select="item"/></div>
	 	<a href="#smCarousel" class="left carousel-control" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"/></a>
	 	<a href="#smCarousel" class="right carousel-control" data-slide="next"><span class="glyphicon glyphicon-chevron-left"/></a> 
	 </div> 
	<!-- Required JavaScript files...(jquery, bootstrap transitions, carousel) -->
	 <script type="text/javascript" src="/_layouts/js/jquery-1.8.0.min.js"/>
	 <script type="text/javascript" src="/SiteCollectionDocuments/bootstrap-transition.js"/>
	 <script type="text/javascript" src="/SiteCollectionDocuments/bootstrap-carousel.js"/> 
	<!-- Initialise carousel and set time between image change -->
	 <script type="text/javascript">$(document).ready(function(){ $('#smCarousel').carousel({interval:3500}) });</script>
</xsl:template>
<xsl:template match="item">
	<div class="item"> 
	<!-- For the first image, give it a class of "item active" -->
	 <xsl:if test="position()='1'">
	 	<xsl:attribute name="class"> item active </xsl:attribute>
	 </xsl:if>
	 <xsl:apply-templates select="openAsset:imageSizes"/>
	 	<div class="carousel-caption">
	 		<a><xsl:attribute name="href">
	 				<xsl:value-of select="link"/> 
	 			</xsl:attribute> 
	 			<h4><xsl:value-of select="openAsset:displayFields/openAsset:projectName"/></h4> 
	 		</a>
	 	</div> 
	 </div>
</xsl:template>
<xsl:template match="openAsset:imageSize">
	<img alt=""> 
		<!-- OpenAsset server name -->
		 <xsl:attribute name="src">
		 	<xsl:text>http://OpenAssetServerName</xsl:text>
		 	<xsl:value-of select="@httpRoot"/> 
		 	<xsl:value-of select="@relativePath"/>
		 </xsl:attribute> 
	</img> 
</xsl:template> 
</xsl:stylesheet>
