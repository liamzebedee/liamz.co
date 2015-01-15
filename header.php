<?php
/**
 * The header for our theme.
 *
 * Displays all of the <head> section and everything up till <div id="content">
 *
 * @package liamz
 */
?><!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php wp_title( '|', true, 'right' ); ?></title>
<link rel="profile" href="http://gmpg.org/xfn/11">
<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">

<?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>
<div id="page" class="hfeed site container">
	<a class="skip-link screen-reader-text" href="#content"><?php _e( 'Skip to content', 'liamz' ); ?></a>

<header id="masthead" class="site-header" role="banner"><div class="shadow-overlay"><div class="inner-padding">
		<div class="site-branding">
			<div id="portrait"><a href="http://liamz.co"><img src="<?= get_bloginfo('template_url') ?>/images/portrait.png" id="portrait-image"></img></a></div>
			<h1 class="site-title"><a href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home"><?php bloginfo( 'name' ); ?></a> <small class="site-description"><?php bloginfo( 'description' ); ?></small></h1>
		</div>

		<nav id="site-navigation" class="main-navigation" role="navigation">
			<button class="menu-toggle" aria-controls="menu" aria-expanded="false"><?php _e( 'Primary Menu', 'liamz' ); ?></button>
			<?php wp_nav_menu( array( 'theme_location' => 'primary' ) ); ?>
		</nav>

</div></div>

<section id="profiles"><div class="inner-padding">
	<nav><ul class="list-inline">
	<!-- INSTAGRAM -->
	<li><div class="sbadge"><a href="http://instagram.com/liamzebedee"><img src="<?= get_bloginfo('template_url') ?>/images/badge-instagram.png" title="Instagram — photoblogging" alt="Instagram"/></a></div>

	<!-- TWITTER -->
	<li><div class="sbadge"><a href="https://twitter.com/liamzebedee"><img alt="Twitter" title="Twitter — microblogging" src="<?= get_bloginfo('template_url') ?>/images/badge-twitter.png"></img></a></div>

	<!-- EMAIL -->
	<li><div class="sbadge"><a href="mailto:liam@liamz.co"><img alt="Email" title="Email" src="<?= get_bloginfo('template_url') ?>/images/badge-email.svg"></img></a></div>

	<!-- MEDIUM -->
	<li><div class="sbadge"><a href="https://medium.com/@liamzebedee"><img title="Medium — a place to share ideas and stories" alt="Medium" src="<?= get_bloginfo('template_url') ?>/images/badge-medium.png"></img></a></div>

	<!-- GITHUB -->
	<li><div class="sbadge"><a href="https://github.com/liamzebedee"><img alt="GitHub" title="GitHub — online collaborative code hosting" src="<?= get_bloginfo('template_url') ?>/images/badge-github.png"></img></a></div>

	<!-- STACKOVERFLOW -->
	<li><div class="sbadge"><a href="http://stackoverflow.com/users/453438/liamzebedee"><img title="StackOverflow — Programming Q&A site" alt="StackOverflow" src="<?= get_bloginfo('template_url') ?>/images/badge-stackoverflow.svg"></img></a></div>

	<!-- LINKEDIN -->
	<li><div class="sbadge sbadge-linkedin"><a href="https://www.linkedin.com/profile/view?id=295704152"><img alt="LinkedIn" title="LinkedIn — professional social network" src="<?= get_bloginfo('template_url') ?>/images/badge-linkedin.png"></img></a></div>

	</ul></nav>
</div></section>

	</header>



	<div id="content" class="site-content row col-xs-12">
