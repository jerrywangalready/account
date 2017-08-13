
<!DOCTYPE HTML>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../comm/head.jsp"%>
<html lang="zh-CN">
<head>
    <meta charset="utf-8" />

    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />

    <title>account</title>
    <script type="text/javascript" src="<%=path%>/account/index/js/index.js"></script>
<body>
<div style="position: relative;height: auto;min-height: 100%;padding-bottom:50px;">

    <!-- START Top-Toolbar -->
    <aside id="top_toolbar" class="top-aside clearfix head_float" style="display: none;">
        <div class="center-wrap">
            <div class="one_half">
                <div class="sidebar-widget">
                    <ul class="custom-menu">
                        <li class="current-menu-item"><a href="javascript:void(0);" onclick="index.js.menuClick('index/init')">首页</a></li>
                        <li><a href="javascript:void(0);" onclick="index.js.menuClick('statistics/init')">餐费统计</a></li>
                        <li name="settings_li" style="display:none;"><a href="javascript:void(0);" onclick="index.js.menuClick('settings/users')">设置1</a></li>
                    </ul>
                </div>
            </div>
            <!-- END top-toolbar-left -->
            <div class="one_half">
                <div class="sidebar-widget">
                    <ul class="social_icons">
                        <li><span class="glyphicon glyphicon-book"></span>
                            <a name="a_object" href="javascript:void(0);" class="" data-toggle="modal" data-target="#Object_Modal"></a>
                        </li>
                        <li><span class="glyphicon glyphicon-user"></span> <a name="a_name" href="javascript:void(0);" class=""></a></li>
                        <li><span class="glyphicon glyphicon-log-out"></span> <a href="javascript:void(0);" class="" onclick="index.js.logout()">退出</a></li>
                    </ul>
                </div>
            </div>
            <!-- END top-toolbar-right -->
        </div>
        <!-- END center-wrap -->
        <div class="top-aside-shadow"></div>
    </aside>
    <aside class="top-aside clearfix">
        <div class="center-wrap">
            <div class="one_half">
                <div class="sidebar-widget">
                </div>
            </div>
            <!-- END top-toolbar-left -->
            <div class="one_half">
                <div class="sidebar-widget">
                    <ul class="social_icons">
                        <li><span class="glyphicon glyphicon-book"></span>
                            <a name="a_object" href="javascript:void(0);" class="" data-toggle="modal" data-target="#Object_Modal"></a>
                        </li>
                        <li><span class="glyphicon glyphicon-user"></span> <a name="a_name" href="javascript:void(0);" class=""></a></li>
                        <li><span class="glyphicon glyphicon-log-out"></span> <a href="javascript:void(0);" class="" onclick="index.js.logout()">退出</a></li>
                    </ul>
                </div>
            </div>
            <!-- END top-toolbar-right -->
        </div>
        <!-- END center-wrap -->
        <div class="top-aside-shadow"></div>
    </aside>
    <!-- END Top-Toolbar -->






    <!-- START Header -->
    <header>
        <div class="center-wrap">
            <div class="companyIdentity">
                <a href="page-template-homepage-jquery.html"><img class="logo" src="<%=path%>/comm/image/logo.png" alt="account" /></a>
            </div>
            <!-- END companyIdentity -->

            <!-- START Main Navigation -->
            <nav>
                <ul id="menu_bar">
                    <li class="current-menu-item"><a href="javascript:void(0);" onclick="index.js.menuClick('index/init')">首页</a></li>
                    <li><a href="javascript:void(0);" onclick="index.js.menuClick('statistics/init')">餐费统计</a></li>
                    <li name="settings_li" style="display:none;"><a href="javascript:void(0);" onclick="index.js.menuClick('settings/users')">设置</a></li>
                    <%--<li><a href="javascript:void(0);" onclick="index.js.menuClick('image/init')">图</a></li :void(0);" onclick="index.js.menuClick('demo/init')">Demo</a></li>--%>
                </ul>
            </nav>
            <!-- END Main Navigation -->
        </div>
        <!-- END center-wrap -->
    </header>
    <!-- END Header -->


    <!-- START Banner Area -->
    <section class="banner-slider" style="height: 20px;">
        <!-- END center-wrap -->
        <div class="shadow top"></div>
        <div class="shadow bottom"></div>
        <div class="tt-overlay"></div>
    </section>
    <!-- END Banner Area -->

    <!-- START Content Container -->
    <section id="content-container" class="clearfix">

    </section>
    <!-- END Content Container -->

    <!-- START Footer Callout -->
    <%--<div class="footer-callout clearfix">--%>
        <%--<div class="center-wrap tt-relative">--%>
            <%--<div class="footer-callout-content">--%>
                <%--<p class="callout-heading">Site-wide callout section</p>--%>
                <%--<p class="callout-text">Engage your customers and promote a rewarding call-to-action. Easily toggle this on or off.</p>--%>
            <%--</div>--%>
            <%--<!-- END footer-callout-content -->--%>
            <%--<div class="footer-callout-button">--%>
                <%--<a href="../../../../../../../../../Documents/hh/H159/content-responsive-design.html" class="large green button">View Theme Features &rarr;</a>--%>
            <%--</div>--%>
            <%--<!-- END footer-callout-button -->--%>
        <%--</div>--%>
        <%--<!-- END center-wrap -->--%>
    <%--</div>--%>
    <!-- END Footer Callout -->

    <!-- START Footer -->
    <footer>
        <!-- END center-wrap -->
        <div class="footer-copyright clearfix">
            <div class="center-wrap clearfix">
                <div class="foot-copy">
                    <p>Copyright &copy; 2017 State Grid Corporation of China. All rights reserved.</p>
                </div>
                <!-- END foot-copy -->
                <a href="#" id="scroll_to_top" class="link-top">Scroll to Top</a>
                <ul class="footer-nav">
                    <li><a href="../../../../../../../../../Documents/hh/H159/page-template-homepage-lightbox-hero.html">Pages</a></li>
                    <li><a href="../../../../../../../../../Documents/hh/H159/content-responsive-design.html">Features</a></li>
                    <li><a href="../../../../../../../../../Documents/hh/H159/content-color-autumn.html">Colors</a></li>
                    <li><a href="../../../../../../../../../Documents/hh/H159/page-template-shortcodelist.html">Shortcodes</a></li>
                    <li><a href="../../../../../../../../../Documents/hh/H159/page-template-blog.html">Blog</a></li>
                </ul>
            </div>
            <!-- END center-wrap -->
        </div>
        <!-- END footer-copyright -->
        <div class="shadow top"></div>
        <div class="tt-overlay"></div>
    </footer>

    <!-- Modal -->
    <div class="modal fade" id="Object_Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog-index" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">切换项目</h4>
                </div>
                <div class="modal-body no-padding-lr">

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>