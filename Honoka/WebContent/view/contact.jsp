<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section id="main" class="container 75%">
		<div class="row">
			<div class="6u 12u(2)">
		<header>
			<h2>Contact Us</h2>
			<p>Tell us what you think about our little operation.</p>
		</header>
		<div class="box">
			<form method="post" action="#">
				<div class="row uniform 50%">
					<div class="6u 12u(3)">
						<input type="text" name="name" id="name" value="" placeholder="Name" />
					</div>
					<div class="6u 12u(3)">
						<input type="email" name="email" id="email" value="" placeholder="Email" />
					</div>
				</div>
				<div class="row uniform 50%">
					<div class="12u">
						<input type="text" name="subject" id="subject" value="" placeholder="Subject" />
					</div>
				</div>
				<div class="row uniform 50%">
					<div class="12u">
						<textarea name="message" id="message" placeholder="Enter your message" rows="6"></textarea>
					</div>
				</div>
				<div class="row uniform">
					<div class="12u">
						<ul class="actions align-center">
							<li><input type="submit" value="Send Message" /></li>
						</ul>
					</div>
				</div>
			</form>
		</div>
		</div></div>
	</section>
	
</body>
</html>