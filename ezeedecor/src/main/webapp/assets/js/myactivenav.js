$(function() {
	switch(menu) {

	case 'Design':
		$('#design').addClass('active');
		break;

	case 'About Us':
		$('#about').addClass('active');
		break;

	case 'Makeover':
		$('#makeover').addClass('active');
		break;

	case 'Samples':
		$('#samples').addClass('active');
		break;

	default:
		$('#home').addClass('active');
		break;

	}
}

);