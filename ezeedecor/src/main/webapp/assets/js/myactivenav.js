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
		
	case 'User Cart':
		$('#userCart').addClass('active');
		break;

	default:
		$('#home').addClass('active');
		// $('#a_' + menu).addClass('active');
		break;

	}
	
	
	//to tackle csrf token
	var token=$('meta[name="_csrf"]').attr('content');
	var header=$('meta[name="_csrf_header"]').attr('content');
	
	if(token.length > 0 && header.length > 0){
		$(document).ajaxSend(function(e,xhr,options){
			xhr.setRequestHeader(header,token);
			
		})
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
									if(userRole=='ADMIN'){
										str += '<a href="'
											+ window.contextRoot
											+ '/manage/'
											+ data
											+ '/product" class="btn btn-success"><span class="glyphicon glyphicon-pencil"></span></a>';
									}else{
										
									
									str += '<a href="'
											+ window.contextRoot
											+ '/cart/add/'
											+ data
											+ '/product" class="btn btn-success"><span class="glyphicon glyphicon-shopping-cart"></span></a>';
									}
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
	
	//validation code for loginform
	var loginForm=$('#loginForm');
	if(loginForm.length){
		loginForm.validate({
			rules: {
				username: {
					required:true,
					email:true
				},
				password:{
					required:true
				}
			},
			messages:{
				username:{
					required:'Please enter the username!',
					email:'Please enter a valid email address!'
				},
				password:{
					required:'Please enter the password!'
					
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

	//handling click event of refresh cart button
	$('button[name="refreshCart"]').click(function(){
		
	//fetch cartline id
		var cartLineId= $(this).attr('value');
		var countElement=$('#count_'+cartLineId);
		var originalCount=countElement.attr('value');
		var currentCount=countElement.val();
		
		//work only when count has changed
		if(currentCount!==originalCount){
			console.log("current count"+currentCount);
			console.log("original count"+originalCount);
			
			if(currentCount<1 ||currentCount>3){
				countElement.val(originalCount);
				window.alert('Product count should be min. 1 & max. 3');
				bootbox.alert({
					size:'medium',
					title:'Error',
					message:'Product count should be min. 1 & max. 3'
				});
			}else{
				
				var updateUrl= window.contextRoot+'/cart/'+cartLineId+'/update?count='+currentCount;
			//forward it to controller
				window.location.href = updateUrl;
				
			}
			
		}
		
	});
	
	
	//designing jquery
	
	$("#floorPlan").resizable();
	
	
	$(".home").draggable({
		helper:'clone'
		});
	
	$("#canvasDiv").droppable({
		  accept:".home",
		  drop:function(event,ui){

	var element=$(ui.helper).clone();
	$(this).append(element);
	$(element).draggable({
	  containment:"#canvasDiv"
	});
		  }
		  });
	
	/*
	$("#preview").on("click",function(){
		html2canvas($("#canvas"),{onrendered:function(){
			var image=canvas.toDataURL("image/png");
			var newData=image.replace(/^data:image\/png/,"data:application/octet-stream");
			
			$("#download").attr("href",newData);
			
		}
		
		});
	});
	*/
	
	var element=$("#canvasDiv");
	var getCanvas;
	$('#preview').on("click",function(){
		html2canvas(element,{onrendered:function(canvas){
		$("#previewSection").append(canvas);	
		getCanvas=canvas;
		}
		});
	
	
	$('#download').on("click",function(){
		var renderImage=getCanvas.toDataURL("image/png");
		var newData=renderImage.replace(/^data:image\/png/,"data:application/octet-stream");
	    $("#download").attr("download","ezeedecor_floorplan.png").attr("href",newData);
		
	});
	});

	 
	
	

});