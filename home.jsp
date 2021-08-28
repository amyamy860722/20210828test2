<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%

String page_code = "home";					// 功能識別碼 , 於資料庫做資料識別及模組程式檔名用
//讀取輪播資料
Vector <TableRecord> aps = app_sm.selectAll(tblap , "ap_lang=? and ap_code=? AND NOT(ap_emitdate>? OR ap_restdate<?)",  new Object[] { lang , "banner", app_today, app_today} , "ap_showseq ASC , ap_createdate DESC");
//主題系列類別資料
Vector <TableRecord> top_pddm = app_sm.selectAll(tbldm,"dm_code=? and dm_lang=? and dm_category=?", new Object[]{"product_category",lang, ""},"dm_showseq ASC , dm_createdate DESC");
//主題系列類別資料限3
Vector <TableRecord> top_pddm2 = app_sm.selectAll(tbldm,"dm_code=? and dm_lang=? and dm_category=?", new Object[]{"product_category",lang, ""},"dm_showseq ASC , dm_createdate DESC limit 3");
//影片花絮資料
Vector <TableRecord> top_video = app_sm.selectAll(tblcp,"cp_code=? and cp_lang=? ", new Object[]{"video",lang},"cp_showseq ASC , cp_createdate DESC");
//門市類別資料
Vector <TableRecord> top_storedm = app_sm.selectAll(tbldm,"dm_code=? and dm_lang=? and dm_category=?", new Object[]{"store_category",lang, ""},"dm_showseq ASC , dm_createdate DESC");
//關於我們資料
Vector<TableRecord> top_about = app_sm.selectAll(tblcp,"cp_code=? and cp_lang=?",new Object[]{"about", lang},"cp_showseq ASC, cp_createdate DESC");
//讀取首頁文案資料
TableRecord index_about = app_sm.select(tblcp , "cp_lang=? and cp_code=?",new Object[] { lang , "index_about"});
//讀取最新消息資料1
TableRecord index_news = app_sm.select(tblcp , "cp_lang=? and cp_code=?",new Object[] { lang , "index_news"});
//最新消息資料-限前4
Vector <TableRecord> top_news = app_sm.selectAll(tblnp, "np_code=? AND np_lang =?  AND NOT(np_emitdate>? OR np_restdate<?)", new Object[]{"news", lang, app_today, app_today }, "np_emitdate DESC , np_createdate DESC limit 4");
//廣告連結
Vector <TableRecord> advertising = app_sm.selectAll(tblap, "ap_code=? AND ap_lang =?", new Object[]{"advertising", lang }, "ap_emitdate DESC , ap_createdate DESC");


%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge"/><!--讓ie在切換瀏覽器模式時 文件模式會使用最新的版本-->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<!--RWD用-->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--RWD用-->

<!--android 手機板主題顏色用 更改網址列顏色-->
<meta name="theme-color" content="#231815">
<!--android 手機板主題顏色用-->

<meta name="format-detection" content="telephone=no"><!--取消行動版 safari 自動偵測數字成電話號碼-->

<title><%=app_webtitle %></title>
<link rel="shortcut icon" href="web/images/favicon.png" /><!--電腦版icon-->
<link rel="apple-touch-icon" href="web/images/icon.png" /><!--手機版icon  57x57px-->
<link rel="apple-touch-icon" sizes="72x72" href="web/images/icon-72.png" /><!--手機版icon  72x72px-->
<link rel="apple-touch-icon" sizes="114x114" href="web/images/icon@2.png" /><!--手機版icon  114x114px-->

<link href="web/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="web/css/style_header.css"/>
<link rel="stylesheet" type="text/css" href="web/css/style_footer.css"/>




<!--google material icon-->
<link rel="stylesheet" href="web/icon_fonts/material_icons/material-icons.css">

<script src="web/js/jquery-1.10.2.min.js" type="text/javascript"></script>

<!--jquery更新版本start 20170603-->
<!--<script src="web/js/jquery-1.11.1.js" type="text/javascript"></script>-->
<!--jquery更新版本end 20170603-->

<script src="web/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

<script src="web/js/common.js" type="text/javascript"></script><!--JavaScript共用區-->

<!--漣漪效果 第一塊 start-->
<link href="web/js/ripples/ripples.css" rel="stylesheet" type="text/css" />
<script src="web/js/ripples/material.js" type="text/javascript"></script>
<script src="web/js/ripples/ripples.min.js" type="text/javascript"></script>
<!--漣漪效果 第一塊 end-->
	
    
<!--新增修改banner套件 modify by pekey 20190625 start-->    
<!--輪播特效 第一塊 開始-->
<link rel="stylesheet" type="text/css" href="web/js/swiper-master/css/swiper.css"/>
<!--輪播特效 第一塊 結束-->
<!--新增修改banner套件 modify by pekey 20190625 end-->
    


<!--當卷軸到一定高度時，物件才會出現-->    	
<script type="text/javascript" src="web/js/wow/wow.min.js"></script>
<link rel="stylesheet" type="text/css" href="web/js/animate/animate.css"/>
<script type="text/javascript" src="web/js/wow/wow_example.js"></script>

    
<!--英文字型-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;500;700&display=swap" rel="stylesheet">

<!--中文字型-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<!--每滑到該區域重複執行-->   
<link rel="stylesheet" type="text/css" href="web/js/aos/aos.css"/>   
 
<!--loading畫面-->
<!--<script>
	$(window).load(function(){
			$('#loading').hide();
	});
</script>-->  

<!-- SEO 讀取關鍵字設定值 (讀取首頁共用值) -->
<meta name="Robots" content="<%=SiteSetup.getText("seo.robots."+lang) %>" />
<meta name="revisit-after" content="<%=SiteSetup.getText("seo.revisit_after."+lang) %> days" />
<meta name="keywords" content="<%=SiteSetup.getText("seo.keywords."+lang) %>" />
<meta name="copyright" content="<%=SiteSetup.getText("seo.copyright."+lang) %>" />
<meta name="description" content="<%=SiteSetup.getText("seo.description."+lang) %>" />
<!-- SEO -->
<!-- 追蹤碼 --><%=SiteSetup.getText("seo.track."+lang) %><!-- 追蹤碼 --> 
</head>
<body>
  
    <div class="headertop" id="top"></div>
    
    <div class="headerArea">

        <!--版頭-->
        <div class="header">
    
            <div class="wrap">

                <!--手機menu按鍵-->
                <div class="menu_btn">
                    <span>
                    </span>
                    <span>
                    </span>
                    <span>
                    </span>
                </div>
                
                
                <!--logo-->
                <div class="logo">
                   <a href="home.jsp">
                        <img src="web/images/logo.png" />
                    </a>
                </div>            
                
                
                <!---版頭右-->
                <div class="headerRight">
    
                    <!--主按鍵-->
                    <div class="navbar">

    
                        <!--最新消息-->
                        <div class="nav">
                            <a href="web/news/news.jsp">
                                最新消息
                            </a>      
                        </div>    
          
                        <!--主題系列-->
                        <div class="nav sst">
                            <div class="navTop">
                                <span class="NavListArrowTop"></span>
                                <a href="javascript:void(0);">
                                    主題系列
                                </a>
                            </div>
                            
                            <!--主按鍵展開-->
                            <div class="navOpen pc">
                                <div class="navOpenBg">
                                
                                    <div class="navOpenBgSstW">

                                        <div class="navOpenBgSstWL">

                                            <div class="navOpenBgSstWLin">
                                                <span>主題系列</span>
                                                <span><%=DateTimeTool.getYear() %>'theme</span>
                                            </div>

                                        </div>

                                        <div class="navOpenBgSstWR">
											<%for(TableRecord pddm : top_pddm){ %>    
                                            <!-- 主題系列主按鍵列表 -->
                                            <div class="navOpenListSst">
                                                <a href="web/product/product.jsp?dm_no=<%=pddm.getString("dm_id")%>">
                                                
                                                    <!-- 主題系列主按鍵圖片 -->
                                                    <div class="navOpenListSstIMG">
                                                        <div class="navOpenListSstIMGin">
                                                            <img src="<%=app_fetchpath+"/product_category/"+lang+"/"+pddm.getString("dm_image1") %>">
                                                        </div>
                                                    </div>

                                                    <!-- 主題系列主按鍵標題 -->
                                                    <div class="navOpenListSstTit">
                                                        <%=pddm.getString("dm_title")%>    
                                                    </div>

                                                </a>
                                            </div>
											<%} %>

                                            
                                            <!-- <div class="clearfloat">
                                            </div> -->
								
                                        </div>
                                        
                                    </div>

                                </div>
                            </div>
                            
                            <div class="navOpen mobile">
                                <div class="navOpenBg">
                                <%for(TableRecord pddm : top_pddm){ %> 
                                    <div class="navOpenList">
                                        <a href="web/product/product.jsp?dm_no=<%=pddm.getString("dm_id")%>">
                                            <%=pddm.getString("dm_title")%>   
                                        </a>
                                    </div>
                                <%} %>     

                                </div>
                            </div>             
                        </div>  
    
                        <!--影片花絮-->
                        <div class="nav">
                            <a href="web/video/video.jsp">
                                影片花絮
                            </a>          
                        </div> 
                        
                        <!--門市查詢-->
                        <div class="nav">
                            <div class="navTop">
                                <span class="NavListArrowTop"></span>
                                <a href="javascript:void(0);">
                                    門市查詢
                                </a>
                            </div>
                            
                            <!--主按鍵展開-->
                            <div class="navOpen pc">
                                <div class="navOpenBg">
                                <%for(TableRecord storedm : top_storedm){ %> 
                                    <div class="navOpenList">
                                        <a href="web/store/store.jsp?dm_no=<%=storedm.getString("dm_id")%>">
                                            <%=storedm.getString("dm_title")%>
                                        </a>
                                    </div>
								<%} %>
                                                                        
                                </div>
                            </div>
                            
                            <div class="navOpen mobile">
                                <div class="navOpenBg">
                                
                                <%for(TableRecord storedm : top_storedm){ %> 
                                    <div class="navOpenList">
                                        <a href="web/store/store.jsp?dm_no=<%=storedm.getString("dm_id")%>">
                                            <%=storedm.getString("dm_title")%>
                                        </a>
                                    </div>
								<%} %>
                                                                        
                                </div>
                            </div> 
                            
                        </div> 
    
                        <!--關於我們-->
                        <div class="nav">
                            <div class="navTop">
                                <span class="NavListArrowTop"></span>
                                <a href="javascript:void(0);">
                                    關於我們
                                </a>
                            </div>
                            
                            <!--主按鍵展開-->
                            <div class="navOpen pc">
                                <div class="navOpenBg">
                                
                                <%for(TableRecord about : top_about){ %> 
                                    <div class="navOpenList">
                                        <a href="web/about/about.jsp?cp_no=<%=about.getString("cp_id")%>">
                                            <%=about.getString("cp_title")%>
                                        </a>
                                    </div>
								<%} %>


                                </div>
                            </div>
                            
                            <div class="navOpen mobile">
                                <div class="navOpenBg">
                                
                                <%for(TableRecord about : top_about){ %> 
                                    <div class="navOpenList">
                                        <a href="web/about/about.jsp?cp_no=<%=about.getString("cp_id")%>">
                                            <%=about.getString("cp_title")%>
                                        </a>
                                    </div>
								<%} %>

                                </div>
                            </div> 
                            
                        </div> 

                        <!--聯繫我們-->
                        <div class="nav">
                            <a href="web/contact/contact.jsp">
                                聯繫我們
                            </a>        
                        </div> 
 
                        <!--周年慶連結-->
                        <div class="nav">
                            <a target="view_blank" href="<%=SiteSetup.getText("cp.anniversaryurl."+lang) %>">
                            	周年慶連結
                            </a>
                        </div> 
                            
                        <div class="clearfloat">
                        </div>
                    </div>
                    
                </div>                
                
                <div class="clearfloat">
                </div>                
                
            </div>

        </div>    
    
    </div>
    
    <!--main-->
    <div class="main index_main">
 
        <div class="index_bannerBg">

            <!--案例展示-->
            <div class="index_bannerPcBg">

                <!--案例展示輪播特效 第一塊 開始-->
                <link rel="Stylesheet" type="text/css" href="web/js/smooth_div_scroll/smoothDivScroll.css" />
                <!-- <link rel="Stylesheet" type="text/css" href="web/js/smooth_div_scroll/css/smoothDivScroll.css" /> -->
                <!--案例展示輪播特效 第一塊 結束-->       
                

                <div class="index_bannerArea" >
                    <%for(TableRecord apl : aps){ %>
                    <div class="index_bannerList">
                        <div class="index_bannerImg">
                        <%if(!apl.getString("ap_target").equals("none")){ %>
							<a href="<%=apl.getString("ap_url")%>" target="<%=apl.getString("ap_target")%>">
						<%}else{ %>
							<a>
						<%} %> 
                                  <img src="<%=app_fetchpath+"/banner/"+lang+"/"+apl.getString("ap_image") %>" title="<%=apl.getString("ap_alt")%>" alt="<%=apl.getString("ap_alt")%>" width="" height="" />  	    
                            </a>
                        </div>
                    </div>
                    <%} %> 


                </div>

                <!--案例展示輪播特效 第二塊 開始-->
                <!--這支js上方已存在-->
                <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>-->
                <script src="web/js/smooth_div_scroll/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
                <script src="web/js/smooth_div_scroll/jquery.mousewheel.min.js" type="text/javascript"></script>
                <script src="web/js/smooth_div_scroll/jquery.kinetic.min.js" type="text/javascript"></script>
                <script src="web/js/smooth_div_scroll/jquery.smoothdivscroll-1.3-min.js" type="text/javascript"></script>

                <script type="text/javascript">
                    $(document).ready(function () {
                        $(".index_bannerArea").smoothDivScroll({
                            mousewheelScrolling: "allDirections",
                            manualContinuousScrolling: true,
                            autoScrollingMode: "onStart"
                        });
                    });
                    
                    $(".index_bannerArea").bind("mouseover", function() {
                        $(this).smoothDivScroll("stopAutoScrolling");
                    }).bind("mouseout", function() {
                        $(this).smoothDivScroll("startAutoScrolling");
                    });
                </script>
            
            </div>

            <div class="index_bannerMobileBg">

                <!--新增修改banner套件 modify by pekey 20190625 start-->
                <!--輪播-->
                <div class="banner">
                    <div class="swiper-container swiper-container_pc">
                    
                        <div class="swiper-wrapper">
                         <%for(TableRecord apl : aps){ %>
                            <div class="swiper-slide">
                                <%if(!apl.getString("ap_target").equals("none")){ %>
									<a href="<%=apl.getString("ap_url")%>" target="<%=apl.getString("ap_target")%>">
								<%}else{ %>
									<a>
								<%} %> 
                                    <div class="mobileBanner" style="background-image: url(<%=app_fetchpath+"/banner/"+lang+"/"+apl.getString("ap_mobile") %>);" title="<%=apl.getString("ap_alt")%>" alt="<%=apl.getString("ap_alt")%>" ></div>

                                </a>	
                            </div>
                         <%} %>   
                         
                            
                        </div>
                    
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                        <div class="swiper-pagination"></div>
                    </div>
                </div>
                <!--新增修改banner套件 modify by pekey 20190625 end-->
        
                <!--新增大banner套件 modify by pekey 20190625 start-->
                <!--輪播特效 第二塊 開始-->
                <script type="text/javascript" src="web/js/swiper-master/js/swiper.min.js"></script>
                <script>
                    var swiper = new Swiper('.swiper-container_pc', {
                        
                        //輪播一次顯示幾張
                        slidesPerView: 1,
                        
                        //輪播位置啟始值為置中
                        centeredSlides: true,
                        
                        //自動輪播
                        autoplay: {
                            delay: 5000,
                            disableOnInteraction: false,
                        },
                        
                        //無限循環
                        loop: true,
                        
                        //輪播點點顯示
                        pagination: {
                                el: '.swiper-container .swiper-pagination',
                                clickable: true,
                            },
                        
                        //左右按鍵點擊效果
                        navigation: {
                            nextEl: '.swiper-button-next',
                            prevEl: '.swiper-button-prev',
                        },
                    });
                </script>
                <!--輪播特效 第二塊 結束-->
                <!--新增大banner套件 modify by pekey 20190625 end-->

            </div>

        </div>


        <!--首頁_關於我們區塊-->
        <div class="index_AboutBg">
        
            <div class="wrap">
            
                <div class="indexAbouArea">

                    <!-- 首頁_關於我們區塊左 -->
                    <div class="index_AboutLeft">

                        <div class="index_AboutImg index_AboutImg1 wow fadeInUp"  data-wow-delay="0.35s"><!--動態效果 wow + animated樣式-->
                            <img src="<%=app_fetchpath+"/index_about/"+lang+"/"+index_about.getString("cp_image") %>">
                        </div>
                        <div class="index_AboutImg index_AboutImg2 wow fadeInUp"  data-wow-delay="0.45s"><!--動態效果 wow + animated樣式-->
                            <img src="<%=app_fetchpath+"/index_about/"+lang+"/"+index_about.getString("cp_mobile") %>">
                        </div>

                    </div>
                    
                    <!-- 首頁_關於我們區塊右 -->
                    <div class="index_AboutRight wow fadeInUp"  data-wow-delay="0.55s"><!--動態效果 wow + animated樣式-->
                        
                        <!--首頁標題樣式-->
                        <div class="index_tit">
                            <div class="index_titIn">

                                <!--首頁標題樣式英文-->
                                <div class="index_titEn">
                                    <%=index_about.getString("cp_title_en") %>
                                </div>
                                <!--首頁標題樣式商標-->
                                <div class="index_titTrademark">
                                    <img src="web/images/logo_tit.png">
                                </div>
                                <!--首頁標題樣式中文-->
                                <div class="index_titTw">
                                    <h1><%=index_about.getString("cp_title") %></h1>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 首頁_文字簡述 -->
                        <section class="index_textArea">
                        	<%=index_about.getString("cp_content").replace(String.valueOf((char)13),"<br/>") %>
                        </section>  

                        <!--首頁_more按鍵-->
                        <div class="index_moreBtn wow fadeIn"  data-wow-delay="0.25s"><!--動態效果 wow + animated樣式-->
                            <a href="web/about/about.jsp">
                                VIEW  MORE
                            </a>
                        </div>

                    </div>

                </div>

            </div>
        
        </div>

<script>
//----------------------------------首頁產品收合----------------------------------
$(function(){

	$(".dinnerImg , .outfitImg").slideUp();

	$(".seriesproductBg").children(".indexProductTitArea").children(".pr1").click(function(e) {
		$(".cityImg").slideDown();
		$(".dinnerImg").slideUp();
		$(".outfitImg").slideUp();
    });	
	
	
	$(".seriesproductBg").children(".indexProductTitArea").children(".pr2").click(function(e) {
		$(".cityImg").slideUp();
		$(".dinnerImg").slideDown();
		$(".outfitImg").slideUp();
	});	
	$(".seriesproductBg").children(".indexProductTitArea").children(".pr3").click(function(e) {
		$(".cityImg").slideUp();
		$(".dinnerImg").slideUp();
		$(".outfitImg").slideDown();
	});	
					
})
</script>


        <!--首頁_產品系列區塊-->
        <div class="index_ProductBg">
        
            <div class="wrap">

                <!-- 首頁_產品系列 -->
                <div class="indexProductArea">

                    <div class="seriesproductBg">

                        <!-- 首頁_產品系列標題區 -->
                        <div class="indexProductTitArea">
							<%for(int j=0;j<top_pddm2.size();j++){
								TableRecord pddm = top_pddm2.get(j); 
							%>
							
                            <!--首頁標題樣式2-->
                            <div class="index_tit2 pr<%=j+1%>">
                                <div class="index_titIn2">
                                    <a href="javascript:void(0);">
        
                                        <!--首頁標題樣式英文-->
                                        <div class="index_titEn2">
                                            <%=pddm.getString("dm_title_en")%>
                                        </div>
                                        <!--首頁標題樣式中文-->
                                        <div class="index_titTw2">
                                            <h2><%=pddm.getString("dm_title")%></h2>
                                        </div>
                                        <!--首頁標題樣式系列-->
                                        <div class="index_seriesproduct">
                                            <%=pddm.getString("dm_title_en2")%>
                                        </div>

                                    </a>
                                </div>
                            </div>
							<%}%>

                            
                            <!--首頁_more按鍵-->
                            <div class="index_moreBtn wow fadeIn"  data-wow-delay="0.25s"><!--動態效果 wow + animated樣式-->
                                <a href="web/product/product.jsp">
                                    VIEW  MORE
                                </a>
                            </div>

                        </div>
						<%
						String productimg_arr [] = {
								 "cityImg",
								 "dinnerImg",
								 "outfitImg"		 
						 };
						%>
                        <!-- 首頁_產品系列圖片區 -->
                        <div class="seriesproductImg seriesproductLeft">
                            
                            <div class="seriesproductImgIn">

                                <div class="indexProductList wow fadeInUp"  data-wow-delay="0.15s"><!--動態效果 wow + animated樣式-->
                                    <a href="web/product/product.jsp">
                                        <%for(int j=0;j<top_pddm2.size();j++){
											TableRecord pddm = top_pddm2.get(j); 
										%>
                                        <img src="<%=app_fetchpath+"/product_category/"+lang+"/"+pddm.getString("dm_image1") %>" class="<%=productimg_arr[j]%>">
                                        <%}%>
                                        <img src="web/index/images/seriesproduct_pic_00.png" class="seriesproductI">
                                    </a>    
                                </div>

                                <div class="indexProductList wow fadeInUp"  data-wow-delay="0.25s"><!--動態效果 wow + animated樣式-->
                                    <a href="web/product/product.jsp">
                                        <%for(int j=0;j<top_pddm2.size();j++){
											TableRecord pddm = top_pddm2.get(j); 
										%>
                                        <img src="<%=app_fetchpath+"/product_category/"+lang+"/"+pddm.getString("dm_image2") %>" class="<%=productimg_arr[j]%>">
                                        <%}%>
                                        <img src="web/index/images/seriesproduct_pic_00.png" class="seriesproductI">
                                    </a>    
                                </div> 

                                <div class="clearfloat">
                                </div>  

                            </div>
  
                        </div>

                        <!-- 首頁_產品系列圖片區 -->
                        <div class="seriesproductImg seriesproductRight">

                            <div class="seriesproductImgIn">

                                <div class="indexProductList wow fadeInUp"  data-wow-delay="0.35s"><!--動態效果 wow + animated樣式-->
                                    <a href="web/product/product.jsp">
                                    	<%for(int j=0;j<top_pddm2.size();j++){
											TableRecord pddm = top_pddm2.get(j); 
										%>
                                        <img src="<%=app_fetchpath+"/product_category/"+lang+"/"+pddm.getString("dm_image3") %>" class="<%=productimg_arr[j]%>">
                                        <%}%>
                                        <img src="web/index/images/seriesproduct_pic_00.png" class="seriesproductI">
                                    </a>    
                                </div>

                                <div class="indexProductList wow fadeInUp"  data-wow-delay="0.45s"><!--動態效果 wow + animated樣式-->
                                    <a href="web/product/product.jsp">
                                    	<%for(int j=0;j<top_pddm2.size();j++){
											TableRecord pddm = top_pddm2.get(j); 
										%>
                                        <img src="<%=app_fetchpath+"/product_category/"+lang+"/"+pddm.getString("dm_image4") %>" class="<%=productimg_arr[j]%>">
                                        <%}%>
                                        
                                        <img src="web/index/images/seriesproduct_pic_00.png" class="seriesproductI">
                                    </a>    
                                </div> 
                                 
                                <div class="clearfloat">
                                </div>  

                            </div>
                                                            
                        </div>

                    </div>

                </div>

            </div>
        
        </div>

        <!--首頁_影片區塊-->
        <div class="index_VideoBg wo`w fadeInUp"  data-wow-delay="0.35s"><!--動態效果 wow + animated樣式-->

            <!--新增修改index_VideoArea套件 modify by pekey 20190625 start-->
            <!--輪播-->
            <div class="index_VideoArea">
                <div class="swiper-container swiper-container_Video">
                
                    <div class="swiper-wrapper">
                    <%for(int j=0;j<top_video.size();j++){
						TableRecord video = top_video.get(j); 
					 %>  
                        <div class="swiper-slide">
                            
                            <!--首頁_影片列表-->
                            <div class="index_VideoList lightBoxShow play_video" id="videoPlay<%=j%>">
                                <!--首頁_影片列表icon-->
                                <div class="index_VideoIcon">
                                    <img src="web/images/play_icon.png"  class="indexVideoIconImg">
                                    <img src="web/images/play_icon_2.png" class="indexVideoIconImg2">
                                    <img src="web/images/play_icon_3.png" class="indexVideoIconImg3">
                                </div>
                                <!--首頁_影片列表圖-->
                                <div class="index_VideoImg" style="background-image: url(<%=app_fetchpath+"/video/"+lang+"/"+video.getString("cp_image") %>);">                                    
                                </div>
                            </div>

                        </div>
                    <%} %>

                    </div>
                
                    <!-- <div class="swiper-button-prev swiper-button-prev_V"></div>
                    <div class="swiper-button-next swiper-button-next_V"></div> -->
                    <div class="swiper-pagination swiper-pagination_V"></div>
                </div>
            </div>
            <!--新增修改index_VideoArea套件 modify by pekey 20190625 end-->
    
            <!--新增大index_VideoArea套件 modify by pekey 20190625 start-->
            <!--輪播特效 第二塊 開始-->
            <script type="text/javascript" src="web/js/swiper-master/js/swiper.min.js"></script>
            <script>
                var swiper = new Swiper('.swiper-container_Video', {
                    
                    //輪播一次顯示幾張
                    slidesPerView: 1,
                    
                    //輪播位置啟始值為置中
                    centeredSlides: true,
                    
                    //自動輪播
                    autoplay: {
                        delay: 5000,
                        disableOnInteraction: false,
                    },
                    
                    //無限循環
                    loop: true,
                    
                    //輪播點點顯示
                    pagination: {
                            el: '.swiper-container .swiper-pagination.swiper-pagination_V',
                            clickable: true,
                        },
                    
                    //左右按鍵點擊效果
                    navigation: {
                        nextEl: '.swiper-button-next.swiper-button-next_V',
                        prevEl: '.swiper-button-prev.swiper-button-prev_V',
                    },
                });
            </script>
            <!--輪播特效 第二塊 結束-->
            <!--新增大index_VideoArea套件 modify by pekey 20190625 end-->

        
        </div>

        <!--首頁_最新消息區塊-->
        <div class="index_NewsBg">
        
            <div class="wrap">
            
                <div class="indexNewsArea">

                    <!-- 首頁_最新消息區塊左 -->
                    <div class="index_NewsLeft wow fadeInUp"  data-wow-delay="0.25s"><!--動態效果 wow + animated樣式-->

                        <!-- 首頁_最新消息列表 -->
                        <%for(TableRecord np:top_news){%>
                        <div class="indexNewsList">
                            <a href="web/news/news_in.jsp?np_id=<%=np.getString("np_id")%>">
                                <!-- 首頁_最新消息列表圖 -->
                                <div class="index_NewsImg">
                                    <img src="<%=app_fetchpath+"/news/"+lang+"/"+np.getString("np_image") %>">
                                </div>
                                <!-- 首頁_最新消息列表資訊 -->
                                <div class="index_NewsBottom">
                                    <div class="index_NewsDate">
                                        <%=np.getString("np_emitdate").replace("/", ".") %>
                                    </div>
                                    <div class="index_NewsTit">
                                        <%=np.getString("np_desc")%>
                                    </div>
                                </div>
                            </a>
                        </div>
						<%} %>
                        

                    </div>
                    
                    <!-- 首頁_最新消息區塊右 -->
                    <div class="index_NewsRight wow fadeInUp"  data-wow-delay="0.45s"><!--動態效果 wow + animated樣式-->
                        
                        <!--首頁標題樣式-->
                        <div class="index_tit">
                            <div class="index_titIn">

                                <!--首頁標題樣式英文-->
                                <div class="index_titEn">
                                    <%=index_news.getString("cp_title_en")%>
                                </div>
                                <!--首頁標題樣式商標-->
                                <div class="index_titTrademark">
                                    <img src="web/images/logo_tit.png">
                                </div>
                                <!--首頁標題樣式中文-->
                                <div class="index_titTw">
                                    <h1><%=index_news.getString("cp_title")%></h1>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 首頁_文字簡述 -->
                        <section class="index_textArea">
                        	<%=index_news.getString("cp_content").replace(String.valueOf((char)13),"<br/>")%>
                        </section>  

                        <!--首頁_more按鍵-->
                        <div class="index_moreBtn wow fadeIn"  data-wow-delay="0.25s"><!--動態效果 wow + animated樣式-->
                            <a href="web/news/news.jsp">
                                VIEW  MORE
                            </a>
                        </div>

                    </div>

                </div>

            </div>
        
        </div>

        <!--首頁_展示區塊-->
        <div class="index_ShowBg">
        
            <div class="wrap">
            
                <div class="indexShowArea">

<%
String advertising_arr [] = {
		 "0.35s",
		 "0.55s",
		 "0.6s",
		 "0.45s",
		 
		 "0.35s",
		 "0.01s",
		 "0.25s",
		 
		 "0.45s",
		 "0.75s",
		 "0.55s",
		 "0.35s",

 };
%>

                    <!-- 首頁_展示區塊上 -->
                    <div class="index_Show index_ShowTop">
						<%
						int advertising_size1 =0;
						if(advertising.size()>4){
							advertising_size1 = 4;
						}else{
							advertising_size1 = advertising.size();
						}
						
						for(int j=0;j<advertising_size1;j++){
							TableRecord apl = advertising.get(j);
						%>
                        <!-- 首頁_展示列表 -->
                        <div class="indexShowList wow zoomIn"  data-wow-delay="<%=j%>"><!--動態效果 wow + animated樣式-->
                        <%if(!apl.getString("ap_target").equals("none")){ %>
							<a href="<%=apl.getString("ap_url")%>" target="<%=apl.getString("ap_target")%>">
						<%}else{ %>
							<a>
						<%} %> 
                                <img src="<%=app_fetchpath+"/advertising/"+lang+"/"+apl.getString("ap_image") %>">
                            </a>                            
                        </div>
						<%} %>

                    </div>

<%if(advertising.size()>=5){ %>
                    <!-- 首頁_展示區塊中 -->
                    <div class="index_Show index_ShowCenter">
						<%
						int advertising_size2 =0;
						if(advertising.size()>7){
							advertising_size2 = 7;
						}else{
							advertising_size2 = advertising.size();
						}
						
						for(int j=4;j<advertising_size2;j++){
							TableRecord apl = advertising.get(j);
						%>
                        <!-- 首頁_展示列表 -->
                        <div class="indexShowList wow zoomIn"  data-wow-delay="<%=j%>"><!--動態效果 wow + animated樣式-->
                        <%if(!apl.getString("ap_target").equals("none")){ %>
							<a href="<%=apl.getString("ap_url")%>" target="<%=apl.getString("ap_target")%>">
						<%}else{ %>
							<a>
						<%} %> 
                                <img src="<%=app_fetchpath+"/advertising/"+lang+"/"+apl.getString("ap_image") %>">
                            </a> 
                        </div>
						<%} %>


                    </div>
<%}%>
<%if(advertising.size()>=8){ %>
                    <!-- 首頁_展示區塊下 -->
                    <div class="index_Show index_ShowBottom">
						<%
						int advertising_size3 =0;
						if(advertising.size()>11){
							advertising_size3 = 11;
						}else{
							advertising_size3 = advertising.size();
						}
						
						for(int j=7;j<advertising_size3;j++){
							TableRecord apl = advertising.get(j);
						%>
                        <!-- 首頁_展示列表 -->
                        <div class="indexShowList wow zoomIn"  data-wow-delay="<%=j%>"><!--動態效果 wow + animated樣式-->
                       	<%if(!apl.getString("ap_target").equals("none")){ %>
							<a href="<%=apl.getString("ap_url")%>" target="<%=apl.getString("ap_target")%>">
						<%}else{ %>
							<a>
						<%} %> 
                                <img src="<%=app_fetchpath+"/advertising/"+lang+"/"+apl.getString("ap_image") %>">
                            </a>
                        </div>
						<%} %>

                    </div>
<%}%>
                </div>

            </div>
        
        </div>

    </div>
    
    
    
    <!--footer-->
	<div class="footer">
    
    	<!--浮動按鈕區塊-->
    	<%-- 
    	<div class="CommunityBtn_area">    
    
            <!--右側浮動FB-->
            <div class="fbBtn">
                
				<a target="_blank" href="#">
                    <img src="web/images/fb_icon3.png" alt="Facebook" title="Facebook" />
                </a>

                <div class="tab_description">
                    Facebook
                </div>
            </div>
           
        </div>
        --%>
        
    	<!--浮動top鍵--><!--js在common.js內-->
        <div class="topBtn">
            <a href="#top">
            	<span>TOP</span>
            </a>
        </div>
        
        <div class="wrap">
                 
            <!--版腳中間-->
            <div class="footer_content">
         
            	<!--版腳左側-->
                <div class="footer_leftBg">
 
                	<!--版腳資訊-->
                    <div class="footerInfoBg">

                        <span>
                        	<%=SiteSetup.getText("cp.company."+lang) %>
                        </span>
                        
                        <span>
                        	<a target="_blank" href="<%=SiteSetup.getText("cp.addressurl."+lang) %>">
                            	ADDRESS：<%=SiteSetup.getText("cp.address."+lang) %>                            
                            	<i class="material-icons">place</i>
                            </a>
                        </span>
                        
                        <span>
                        	<a href="tel:<%=SiteSetup.getText("cp.phone."+lang) %>">PHONE：<%=SiteSetup.getText("cp.phone."+lang) %></a>
                        </span>

                        <span>
                        	FAX：<%=SiteSetup.getText("cp.fax."+lang) %>
                        </span>

                        <span>
                        	<a href="mailto:<%=SiteSetup.getText("cp.email."+lang) %>">EMAIL：<%=SiteSetup.getText("cp.email."+lang) %></a>
                        </span>
                    </div>                 
                
                    <div class="copyright"> 
                    	© <%=DateTimeTool.getYear() %> <a href="https://www.geneinfo.com.tw/" target="view_blank">Greatest Idea Strategy Co.,Ltd</a> All rights reserved.
                    </div>   
                                 
                </div>   
            
            	<div class="footer_rightBg">
                
                    <!--版腳logo-->
                    <div class="footerLogo">
                        <a href="home.jsp">
                            <img src="web/images/logo_f.png"/>
                        </a>
                    </div>   
                
                	<div class="footerCommunityArea">
                    <%if(!SiteSetup.getText("cp.fb."+lang).equals("")){ %>
                         <div class="footerCommunitylist fb">                    
                            <a target="_blank" href="<%=SiteSetup.getText("cp.fb."+lang) %>">
                            	<img src="web/images/fb_icon.png"/>
                            </a>
                        </div> 
                    <%}%>     
                    <%if(!SiteSetup.getText("cp.ig."+lang).equals("")){ %>    
                        <div class="footerCommunitylist ig">                    
                            <a target="_blank" href="<%=SiteSetup.getText("cp.ig."+lang) %>">
                            	<img src="web/images/ig_icon.png">
                            </a>
                        </div> 
                    <%}%>      
                    <%if(!SiteSetup.getText("cp.line."+lang).equals("")){ %>    
                    
                         <div class="footerCommunitylist line">                    
                            <a target="_blank" href="<%=SiteSetup.getText("cp.line."+lang) %>">
                            	<img src="web/images/line_icon.png"/>
                            </a>
                        </div> 
                    <%}%>      
                    <%if(!SiteSetup.getText("cp.youtube."+lang).equals("")){ %>    
                        <div class="footerCommunitylist yutube">                    
                            <a target="_blank" href="<%=SiteSetup.getText("cp.youtube."+lang) %>">
                            	<img src="web/images/yutube_icon.png">
                            </a>
                        </div> 
                   	<%}%>                                                                         
                    </div>

                </div>
            
            </div>             
            


        </div> 
        
    </div>
    


    <!--每滑到該區域重複執行-->   
    <!-- <script type="text/javascript" src="web/js/aos/aos.js"></script> 
    <script>
      AOS.init();
    </script>      -->


    <!--燈箱效果-->
	<script type="text/javascript" src="web/js/lightbox.js"></script>
    <script type="text/javascript">
        $(function(){
            
            //會開啟燈箱的按鍵點擊時  顯示燈箱內相應的區塊
            $(".lightBoxShow").click(function(e) {
                var thisId = $(this).attr("id");
                $('#'+thisId+'_area').show().siblings().hide();
            });
            
            
            
            //添加限時搶購燈箱樣式用
            $("#limit_buy").click(function(e) {
                $(".lightboxArea").addClass("limit_use");
            });
            
            //燈箱內是影片時
            $(".play_video").click(function(e) {
                $(".lightboxArea").addClass("video_use");			//添加影片燈箱的樣式
                
                var thisId = $(this).attr("id");							//取得相對應燈箱區塊的data-url(youtube網址)
                var youtubeUrl = $('#'+thisId+'_area').attr("data-url");	//→↑
                //console.log(youtubeUrl);				
                var iframeDom = $(youtubeUrl);
                iframeDom.appendTo($('#'+thisId+'_area'));					//添加iframe到相對應的區塊內
            });
            
            $(".lightboxClose, .lightboxBG").click(function(e) {
                setTimeout(function(){
                    $(".lightboxArea").removeClass("video_use");	//移除影片燈箱的樣式
                },300)
                $(".video iframe").remove();								//移除iframe
            });
            
        })
    </script>
    
    <!--燈箱-->
    <div class="lightboxArea">
        
        <!--燈箱黑底-->
        <div class="lightboxBG">
        </div>
        
        <!--燈箱主體-->
        <div class="lightboxMain">
            
            <!--關閉燈箱按鍵-->
            <div class="lightboxCloseBtn lightboxClose">
                X
            </div>
            
            <!--燈箱資料區-->
            <div class="lightboxContentArea">
				<%for(int j=0;j<top_video.size();j++){
					TableRecord video = top_video.get(j); 
				%> 
                <div class="video" id="videoPlay<%=j %>_area" data-url='<iframe width="100%" height="auto" src="<%=video.getString("cp_url") %>" frameborder="0" allowfullscreen></iframe>'>
                    <!--iframe整段dom放在 data-url 裡 為了自動播放 要自動播放的話後面要加&autoplay=1↑↑↑↑-->
                </div>
    			<%} %>

            </div>
            
        </div>
        
    </div>	




</body>

</html>    