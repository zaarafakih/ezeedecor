$(function() {
	switch (menu) {

	case 'Design':
		$('#design').addClass('active');
		break;

	case 'About Us':
		$('#about').addClass('active');
		break;

	case 'All Products':
		$('#shop').addClass('active');
		break;

	case 'Makeover':
		$('#makeover').addClass('active');
		break;

	case 'Samples':
		$('#samples').addClass('active');
		break;

	case 'Manage Products':
		$('#manageProducts').addClass('active');
		break;

	default:
		$('#home').addClass('active');
		// $('#a_' + menu).addClass('active');
		break;

	}

	// code for jquery datatable
	// create dataset
	var jsonUrl = '';
	if (window.categoryId == '') {
		jsonUrl = window.contextRoot + '/json/data/all/products';
	} else {
		jsonUrl = window.contextRoot + '/json/data/category/'
				+ window.categoryId + '/products';
	}

	var $table = $('#productListTable');

	if ($table.length) {
		// console.log('inside the table');
		$table
				.DataTable({
					lengthMenu : [ [ 3, 5, 6, -1 ],
							[ '3 rec', '5 rec', '6 rec', 'all' ] ],
					pageLength : 5,
					ajax : {
						url : jsonUrl,
						dataSrc : ''
					},
					columns : [
							{
								data : 'code',
								mRender : function(data, type, row) {
									return '<img src="' + window.contextRoot
											+ '/resources/images/' + data
											+ '.jpg" class="dataTableImg"/>';
								}
							},

							{
								data : 'name',
							},
							{
								data : 'brand',
							},
							{
								data : 'unitPrice',
								mRender : function(data, type, row) {
									return '&#8377; ' + data
								}
							},

							{
								data : 'quantity',
							},

							{
								data : 'id',
								bSortable : false,
								mRender : function(data, type, row) {
									var str = '';
									str += '<a href="'
											+ window.contextRoot
											+ '/show/'
											+ data
											+ '/product" class="btn btn-primary"><span class="glyphicon glyphicon-eye-open"></span></a>&#160;&#160;';
									str += '<a href="'
											+ window.contextRoot
											+ '/cart/add/'
											+ data
											+ '/product" class="btn btn-success"><span class="glyphicon glyphicon-shopping-cart"></span></a>';
									return str;
								}
							} ]

				});
	}
	
	
	//Admin Products Table
	
	var jsonUrl = window.contextRoot + '/json/data/admin/all/products';
	

	var $adminProductsTable = $('#adminProductsTable');

	if ($adminProductsTable.length) {
		// console.log('inside the table');
		$adminProductsTable
				.DataTable({
					lengthMenu : [ [ 30, 50, 60, -1 ],
							[ '30 rec', '50 rec', '60 rec', 'all' ] ],
					pageLength : 30,
					ajax : {
						url : jsonUrl,
						dataSrc : ''
					},
					columns : [
					           {
					        	   data:'id'
					           },
							{
								data : 'code',
								mRender : function(data, type, row) {
									return '<img src="' + window.contextRoot
											+ '/resources/images/' + data
											+ '.jpg" class="adminDataTableImg"/>';
								}
							},

							{
								data : 'name',
							},
							{
								data : 'brand',
							},
							{
								data : 'quantity',
								mRender : function(data, type, row) {
									var str='';
									if(data<1){
										str+='<span style="color:red">Out of Stock!</span>';
									}else{
										str+=data;
									}
									return str;
								}
							},
							{
								data : 'unitPrice',
								mRender : function(data, type, row) {
									return '&#8377; ' + data
								}
							},

							
							{
								data : 'active',
								bSortable:false,
								mRender : function(data, type, row) {
									var str='';
									str+='<label class="switch">';
									if(data){
										str+='  <input type="checkbox" checked="checked" value="'+row.id+'"/>';
									}else{
										str+='  <input type="checkbox" value="'+row.id+'"/>'
									}
										
										str+='<span class="slider round"></span></label>'
											

									return str;
								}
							} ,
							{
								data:'id',
								bSortable:false,
								mRender : function(data, type, row) {
									var str='';
									str+='<a href="'+window.contextRoot+'/manage/'+data+'/product" class="btn btn-warning">';
										str+='<span class="glyphicon glyphicon-pencil"></span></a>';
										
									return str;
								}
							}
							],
							initComplete:function(){
								var api=this.api();
								api.$('.switch input[type="checkbox"]')
								.on(
										'change',
										function() {

											var checkbox = $(this);
											var checked = checkbox.prop('checked');
											var dMsg = (checked) ? 'You want to activate the product?'
													: 'You want to deactivate the product?';
											var value = checkbox.prop('value');
											bootbox
													.confirm({
														size : 'medium',
														title : 'Product Activation & Deactivation',
														message : dMsg,
														callback : function(confirmed) {
															if (confirmed) {
																console.log(value);
																var activationUrl=window.contextRoot+'/manage/product/'+value+'/activation';
																$.post(activationUrl,function(data){
																	bootbox
																	.alert({
																		size : 'medium',
																		title : 'Information',
																		message : data
																	});
																});
																
															} else {
																checkbox.prop('checked', !checked);
															}
														}

													});
										});
							}

				});
	}
	
	//-------------
	//validation code for category
	var $categoryForm=$('#categoryForm');
	if($categoryForm.length){
		$categoryForm.validate({
			rules: {
				name: {
					required:true,
					minlength:2
				},
				description:{
					required:true
				}
			},
			messages:{
				name:{
					required:'Please add a category name!',
					minlength:'The category name should not be less tha  2 characters!'
				},
				description:{
					required:'Please add a description for this category!',
					
				}
			},
			errorElement:'em',
			errorPlacement: function(error,element){
				//add class of help-block
				error.addClass('help-block');
				error.insertAfter(element);
			}
		});	
	}
	
	
	// dismissing alert after 3 seconds
	var $alert = $('.alert');
	if ($alert.length) {
		setTimeout(function() {
			$alert.fadeOut('slow');
		}, 3000)
	}

	// ------

	

});