<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>WELCOME TO TEAMPLACE!</title>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/landing-page.css" rel="stylesheet">
<link href="./css/interactive.css" rel="stylesheet">
<script src="./js/jquery-1.11.1.min.js"></script>
<script src="./js/jquery.blockUI.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		$(".loginpopupbtn").click(function(){
			prelogin();
			checkcookie();
		});
		$(".signuppopupbtn").click(function() {
			presignup();
			checkcookie();
		});
		$("#loginprocessbtn").click(login);
//		$("#loginbox").on("click", "#joinprocessbtn", join);
		$("#joinprocessbtn").click(join);
	});
	
	function join(){
		var useremail=$("#useremail").val();
		var userpassword=$("#userpassword").val();
		var usernickname=$("#usernickname").val();
		$.ajax({
			"url":"signup.do",
			"type":"post",
			"data":{
				"useremail":useremail,
				"userpassword":userpassword,
				"usernickname":usernickname
			},
			"success":checksignup,
			"dataType":"json"
		});
	}
	
	function checksignup(resultmap){
		if(resultmap.flag==1){
			alert("중복된 아이디입니다. 다른 아이디를 사용해주세요.");
		}else if(resultmap.flag==2){
			alert("중복된 닉네임입니다. 다른 닉네임을 사용해주세요.");
		}else {
			location.href="main_empty.jsp";
		}
	}

	function checkcookie(){
		$.ajax({
			"url":"ajax/checkcookie.do",
			"type":"post",
			"success":loginpopup,
			"dataType":"json"
		});
	}
	
	function loginpopup(flag) {
		$.blockUI({ 
			message: $("#loginbox"), 
			css: {cursor: null, top: "100px"},
			overlayCSS: {cursor: null, backgroundColor: "#aaa", opacity: 0.7},
		});
		$("#close").click(function() {
			$.unblockUI();
		});
		$("#loginbox #useremail").val("${cookie.useremail.value}");
		if (flag) {
			$("#loginbox #remembermyaccount").attr("checked", true);
		}
		$("#switchjoinatag").click(presignup);
		$("#switchloginatag").click(prelogin);
	}

	function prelogin() {
		$(".form-signin-heading").text("Login")
		$("#switchtext").css("display", "inline");
		$("#usernickname").css("display", "none");
		$("#usernickname").removeAttr("required");
		$("#usernicknamelabel").css("display", "none");
		$("#loginprocessbtn").css("display", "block");
		$("#joinprocessbtn").css("display", "none");
		$("#switchjoinatag").css("display", "inline");
		$("#switchloginatag").css("display", "none");
	}
	function presignup() {
		$(".form-signin-heading").text("Sign up")
		$("#switchtext").css("display", "none");
		$("#usernickname").css("display", "block");
		$("#usernickname").attr("required", "required");
		$("#usernicknamelabel").css("display", "block");
		$("#loginprocessbtn").css("display", "none");
		$("#joinprocessbtn").css("display", "block");
		$("#switchjoinatag").css("display", "none");
		$("#switchloginatag").css("display", "inline");
	}

	function login() {
		var useremail = $("#useremail").val();
		var userpassword = $("#userpassword").val();
		var remember = ""
		if ($("#remembermyaccount").is(":checked")) {
			remember = $("#remembermyaccount").val();
		}
		$.ajax({
			"url" : "userlogin.do",
			"type" : "post",
			"data" : {
				"useremail" : useremail,
				"userpassword" : userpassword,
				"remember" : remember
			},
			"success" : loginprocess,
			"dataType" : "json"
		});
	}

	function loginprocess(user) {
		if (!user.flag) {
			alert("아이디와 비밀번호를 확인해주세요");
		} else {
			var useremail = user.useremail;
			if (useremail == 'admin@admin') {
				location.href = "admin_login.do";
			} else {
				var list=user.teamlist;
				if(list.length==0){
					location.href = "main_empty.jsp";
				} else {
					location.href = "main.jsp";
				}
			}
		}
	}
</script>
<body>

<!-- 로그인 / 회원가입 pop up -->
<%-- <%@ include file="./index_login.jsp" %>
 --%>
    <!-- Navigation -->
    <nav style="margin-bottom: 0px;" class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
				<a style="color: #59C1A7;" class="navbar-brand" href="#">TEAMPLACE</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a style="cursor: pointer; color: #F47E1E;">둘러보기</a>
                    </li>
                    <li>
                        <a class="loginpopupbtn" style="cursor: pointer; color: #F47E1E;">시작하기</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Header -->
    <div style="margin-top: -50px;" class="intro-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1>TEAMPLACE</h1>
                        <h3>for your perfect team project</h3>
                        <hr class="intro-divider">
                        <ul class="list-inline intro-social-buttons">
                            <li>
                                <a class="btn btn-default btn-lg signuppopupbtn"><span class="network-name">SIGN UP</span></a>
                            </li>
                            <li>
                                <a class="btn btn-default btn-lg loginpopupbtn"><span class="network-name">LOG IN</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container -->

    </div>
    <!-- /.intro-header -->

    <!-- Page Content -->

    <div class="content-section-a">

        <div class="container">

            <div class="row">
                <div class="col-lg-5 col-sm-6">
                    <hr class="section-heading-spacer">
                    <div class="clearfix"></div>
                    <h2 class="section-heading">오늘까지 뭘 해야했는데<br>기억은 나지 않고 초조할 때?</h2>
                    <p class="lead">당신이 해야하는 모든 일을 정리해주는 <strong>TODOLIST</strong>, 진행상황과 과정을 통해 당신의 시간을 절약해드립니다.</p>
                </div>
                <div class="col-lg-5 col-lg-offset-2 col-sm-6">
                    <img class="img-responsive" src="image/content_one.jpg" alt="">
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.content-section-a -->

    <div class="content-section-b">

        <div class="container">

            <div class="row">
                <div class="col-lg-5 col-lg-offset-1 col-sm-push-6  col-sm-6">
                    <hr class="section-heading-spacer">
                    <div class="clearfix"></div>
                    <h2 class="section-heading">자료 검색에 정리, 분류까지...<br>피곤한 문서작업에 지쳤다면?</h2>
                    <p class="lead">여기, 당신을 대신해 <strong>링크를 구분하고 주석을 처리하는 </strong>착한 프로그램이 당신의 학점을 올려줍니다.</p>
                </div>
                <div class="col-lg-5 col-sm-pull-6  col-sm-6">
                    <img class="img-responsive" src="image/content_two.jpg" alt="">
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.content-section-b -->

    <div class="content-section-a">

        <div class="container">

            <div class="row">
                <div class="col-lg-5 col-sm-6">
                    <hr class="section-heading-spacer">
                    <div class="clearfix"></div>
                    <h2 class="section-heading">팀플만 하면 틀어지는 인간관계,<br>항상 바쁘다는 프리라이더...</h2>
                    <p class="lead">모두의 스케줄을 공유하는 <strong>달력</strong>, 역할분담을 통한 공정한 <strong>할일 분담</strong>을 통해 당신의 인간관계를 지켜드립니다.</p>
                </div>
                <div class="col-lg-5 col-lg-offset-2 col-sm-6">
                    <img class="img-responsive" src="image/content_three.jpg" alt="">
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.content-section-a -->

    <div class="content-section-b">

        <div class="container">

            <div class="row">
                <div class="col-lg-5 col-lg-offset-1 col-sm-push-6  col-sm-6">
                    <hr class="section-heading-spacer">
                    <div class="clearfix"></div>
                    <h2 class="section-heading">비슷한 내용 일색의 지루한 회의,<br>소모적인 회의를 피하고 싶다면?</h2>
                    <p class="lead">당신의 생각을 표현할 수 있는 <strong>실시간 그림판</strong>과 <br><strong>다양한 회의도구</strong>로 당신의 기분까지 책임집니다.</p>
                </div>
                <div class="col-lg-5 col-sm-pull-6  col-sm-6">
                    <img class="img-responsive" src="image/content_four.jpg" alt="">
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.content-section-b -->

    <div class="banner">

        <div class="container">

            <div class="row">
                <div class="col-lg-6">
                    <h2>팀플레이스 시작하기 :</h2>
                </div>
                <div class="col-lg-6">
                    <ul class="list-inline banner-social-buttons">
                        <li>
                            <a class="btn btn-default btn-lg signuppopupbtn"><span class="network-name">회원가입</span></a>
                        </li>
                        <li>
                            <a class="btn btn-default btn-lg loginpopupbtn"><span class="network-name">로그인</span></a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.banner -->

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <p class="copyright text-muted small">Copyright &copy; Gooever 2014. All Rights Reserved</p>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>