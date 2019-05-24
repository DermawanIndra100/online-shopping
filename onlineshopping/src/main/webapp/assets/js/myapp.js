$(function(){
	
	//solving the active menu problem
	switch(menu) {
	
		case 'About Us':
			$('#about').addClass('active');
			break;
		case 'Contact Us':
			$('#contact').addClass('active');
			break;
		case 'Home':
			$('#home').addClass('active');
			break;
		case 'All Products':
			$('#listProducts').addClass('active');
			break;
		case 'Manage Products':
			$('#manageProducts').addClass('active');
			break;
		default:
			if(menu == "Home") break;
			$('#listProducts').addClass('active');
			$('#a_'+menu).addClass('active');
			break;
	}
	
	// code for jquery dataTable
	// create a dataset
//	var products = [
//	                	['1','ABC'],
//	                	['2','BBB'],
//	                	['3','CCC'],
//	                	['4','DDD'],
//	                	['5','EEE'],
//	                	['6','FFF'],
//	                	['7','GGG'],
//	                	['8','HHH']
//	                ];
	
	
	var $table = $('#productListTable');
	
	//execute the below code only where we have this table
	if($table.length){
//		console.log('Inside the table!');
		
		var jsonUrl = '';
		if (window.categoryId == '') {
			jsonUrl = window.contextRoot + '/json/data/all/products';
		} else {
			jsonUrl = window.contextRoot + '/json/data/category/'+ window.categoryId +'/products';
		}
		
		$table.DataTable({
		lengthMenu: [[3,5,10,-1], ['3 ', '5 ', '10 ', 'ALL']],
		pageLength: 5,
		ajax: {
			url: jsonUrl,
			dataSrc: ''
		}, 
		columns: [
				{
					data: 'code',
					mRender: function(data, type, row){
						return '<img src="'+window.contextRoot+'/resources/images/'+data+'.JPG" class="dataTableImg"/>';
					}
				 },
		         {
		        	data: 'name'
		         },
		         {
		        	data: 'brand' 
		         },
		         {
		        	 data: 'unitPrice',
		        	 mRender: function(data, type, row){
		        		 return '&#82;&#112; ' + data
		        	 }
		         },
		         {
		        	 data: 'quantity',
		        	 mRender : function(data, type, row) {

							if (data < 1) {
								return '<span style="color:red">Out of Stock!</span>';
							}

							return data;

						}
		         },
		         {
		        	 data: 'id',
		        	 bSortable: false,
		        	 mRender: function(data, type, row){
		        		 var str = '';
		        		 str += '<a href="'+window.contextRoot+ '/show/'+data+'/product" class="btn btn-success"><i class="fa fa-eye"></i></a> &#160';
		        		 
		        		 if (row.quantity < 1) {
		        			 str += '<a href="javascript:void(0)" class="btn btn-info disabled"><i class="fa fa-shopping-cart"></i></a>';
							} else {

								str += '<a href="'+window.contextRoot+ '/cart/add/'+data+'/product" class="btn btn-info"><i class="fa fa-shopping-cart"></i></a>';
							}
		        		 
		        		 return str;
		        		 
		        		 
		        	 }
		         
		         }
		         
		         ]
		
		
		
		});
	}
	
	
	var $alert = $('.alert');
	
	if($alert.length){
		setTimeout(function(){
			$alert.fadeOut('slow');
		}, 3000)
	}
	
//	// ----------------------------------------------------------
//	
//	$('.switch input[type="checkbox"]').on('change', function() {
//		
//		var checkbox = $(this);
//		var checked = checkbox.prop('checked');
//		var dMsg = (checked)? 'You want to activate the product?':
//							  'You want to deactivate the product?';
//		var value = checkbox.prop('value');
//		
//		bootbox.confirm({
//			size: 'medium',
////			title: 'Product Activation & Deactivation',
//			message: dMsg,
//			callback: function(confirmed){
//				
//				if(confirmed){
//					console.log(value);
//					bootbox.alert({
//						size: 'medium',
////						title: 'Information',
//						message: 'You are going to perform operation on product' + value
//					});
//				}
//				else{
//					checkbox.prop('checked', !checked);
//				}
//				
//			}
//		});
//		
//		
//	});
	
	
	
	//--------------------------Data Table For Admin ----------------------------------------------------
	
	var $adminProductsTable = $('#adminProductsTable');
	
	//execute the below code only where we have this table
	if($adminProductsTable.length){
		//		console.log('Inside the table!');
		
		var jsonUrl = window.contextRoot + '/json/data/admin/all/products';
		
		$adminProductsTable.DataTable({
		lengthMenu: [[10, 30, 50,-1], ['10 ', '30 ', '50 ', 'ALL']],
		pageLength: 10,
		ajax: {
			url: jsonUrl,
			dataSrc: ''
		}, 
		columns: [
		        {
		        	data: 'id'
		        },
				{
					data: 'code',
					bSortable: false,
					mRender: function(data, type, row){
						return '<img src="'+window.contextRoot+'/resources/images/'+data+'.JPG" class="adminDataTableImg"/>';
					}
				 },
		         {
		        	data: 'name'
		         },
		         {
		        	data: 'brand' 
		         },
		         {
		        	 data: 'quantity',
		        	 mRender : function(data, type, row) {

							if (data < 1) {
								return '<span style="color:red">Out of Stock!</span>';
							}

							return data;

						}
		         },
		         {
		        	 data: 'unitPrice',
		        	 mRender: function(data, type, row){
		        		 return '&#82;&#112; ' + data
		        	 }
		         },
		         {
						data : 'active',
						bSortable : false,
						mRender : function(data, type, row) {
							var str = '';
							str += '<label class="switch">';
							if(data) {											
								str += '<input type="checkbox" checked="checked" value="'+row.id+'" />';
								
							}else {
								str += '<input type="checkbox" value="'+row.id+'" />';
							}
							
							str += '<div class="slider"></div></label>';
							return str;
						}
					},
					{
						data : 'id',
						bSortable : false,
						mRender : function(data, type, row) {

							var str = '';
							str += '<a href="${contextRoot}/manage/'+data+'/product" class="btn btn-warning">';
							str += '<i class="fa fa-pencil"></i></a>';
							return str;
						}
					}	
					
				
		         ],
		         
	//--------------------------------------------------------------toggle on of----------------------------//
		         
		         initComplete: function(){
		        	 
		        	 var api = this.api();
		        	 api.$('.switch input[type="checkbox"]').on('change', function() {
		        			
		        			var checkbox = $(this);
		        			var checked = checkbox.prop('checked');
		        			var dMsg = (checked)? 'You want to activate the product?':
		        								  'You want to deactivate the product?';
		        			var value = checkbox.prop('value');
		        			
		        			bootbox.confirm({
		        				size: 'medium',
//		        				title: 'Product Activation & Deactivation',
		        				message: dMsg,
		        				callback: function(confirmed){
		        					
		        					if(confirmed){
		        						console.log(value);
		        						var activationUrl = 
		        							window.contextRoot + '/manage/product/'+ value +'/activation';
		        						
		        						$.post(activationUrl, function(data){
		        							bootbox.alert({
			        							size: 'medium',
//			        							title: 'Information',
			        							message: data
			        						});
		        						});
		        						
		        					}
		        					else{
		        						checkbox.prop('checked', !checked);
		        					}
		        					
		        				}
		        			});
		        			
		        			
		        		});
		         }
		
		
		
		});
	}
	
	//---------------------------------------------------------------------------------------------------
	
});
