function LoadHumanCount(DataEvtObj)
	{
		for( var i = 0; i < DataEvtObj.length ; i++){					
			var compare_value = parseInt(DataEvtObj[i].PERSON_BACK_1D) - parseInt(DataEvtObj[i].PERSON);
			var display_value;
			if(compare_value < 0){
				display_value = '▲' + Math.abs(compare_value);
				document.getElementById('compare_person_cnt').style.color = '#eb6877';
				$('#compare_person_cnt').html(display_value);
			}else{						
				display_value = '▼' +  Math.abs(compare_value);
				document.getElementById('compare_person_cnt').style.color = '#00b7ee';
				$('#compare_person_cnt').html(display_value);
			}
			$('#total_person_cnt').html(DataEvtObj[i].PERSON);				
		}	
	}

	function LoadVehicleCount(DataEvtObj)				
	{
		for( var i = 0; i < DataEvtObj.length ; i++){					
			var compare_value = parseInt(DataEvtObj[i].VEHICLE_BACK_1D) - parseInt(DataEvtObj[i].VEHICLE);
			var display_value;
			if(compare_value < 0){
				display_value = '▲' + Math.abs(compare_value);
				document.getElementById('compare_vehicle_cnt').style.color = '#eb6877';
				$('#compare_vehicle_cnt').html(display_value);
			}else{						
				display_value = '▼' +  Math.abs(compare_value);
				document.getElementById('compare_vehicle_cnt').style.color = '#00b7ee';
				$('#compare_vehicle_cnt').html(display_value);
			}
			$('#total_vehicle_cnt').html(DataEvtObj[i].VEHICLE);				
		}
	}

	function LoadFaceCount(DataEvtObj)
	{
		for( var i = 0; i < DataEvtObj.length ; i++){				
			var compare_value = parseInt(DataEvtObj[i].FACE_BACK_1D) - parseInt(DataEvtObj[i].FACE);
			var display_value;
			if(compare_value < 0){
				display_value = '▲' + Math.abs(compare_value);
				document.getElementById('compare_face_cnt').style.color = '#eb6877';
				$('#compare_face_cnt').html(display_value);
			}else{						
				display_value = '▼' +  Math.abs(compare_value);
				document.getElementById('compare_face_cnt').style.color = '#00b7ee';
				$('#compare_face_cnt').html(display_value);
			}
			$('#total_face_cnt').html(DataEvtObj[i].FACE);
		}		
	}

	function LoadInvCount(DataEvtObj)
	{
		for( var i = 0; i < DataEvtObj.length ; i++){				
			var compare_value = parseInt(DataEvtObj[i].INV_CNT_BACK_1D) - parseInt(DataEvtObj[i].INV_CNT);
			var display_value;
			if(compare_value < 0){
				display_value = '▲' + Math.abs(compare_value);
				document.getElementById('compare_inv_cnt').style.color = '#eb6877';
				$('#compare_inv_cnt').html(display_value);
			}else{						
				display_value = '▼' +  Math.abs(compare_value);
				document.getElementById('compare_inv_cnt').style.color = '#00b7ee';
				$('#compare_inv_cnt').html(display_value);
			}
			$('#total_inv_cnt').html(DataEvtObj[i].INV_CNT);			
		}			
	}

	function LoadCountingCount(DataEvtObj)
	{
		for( var i = 0; i < DataEvtObj.length ; i++){					
			var compare_value = parseInt(DataEvtObj[i].CNT_CNT_BACK_1D) - parseInt(DataEvtObj[i].CNT_CNT);
			var display_value;
			if(compare_value < 0){
				display_value = '▲' + Math.abs(compare_value);
				document.getElementById('compare_count_cnt').style.color = '#eb6877';
				$('#compare_count_cnt').html(display_value);
			}else{						
				display_value = '▼' +  Math.abs(compare_value);
				document.getElementById('compare_count_cnt').style.color = '#00b7ee';
				$('#compare_count_cnt').html(display_value);
			}
			$('#total_count_cnt').html(DataEvtObj[i].CNT_CNT);
		}
	}
	 
	function LoadLotCount(DataEvtObj)
	{
		for( var i = 0; i < DataEvtObj.length ; i++){				
			var compare_value = parseInt(DataEvtObj[i].LOT_CNT_BACK_1D) - parseInt(DataEvtObj[i].LOT_CNT);
			var display_value;
			if(compare_value < 0){
				display_value = '▲' + Math.abs(compare_value);
				document.getElementById('compare_lot_cnt').style.color = '#eb6877';
				$('#compare_lot_cnt').html(display_value);
			}else{						
				display_value = '▼' +  Math.abs(compare_value);
				document.getElementById('compare_lot_cnt').style.color = '#00b7ee';
				$('#compare_lot_cnt').html(display_value);
			}
			$('#total_lot_cnt').html(DataEvtObj[i].LOT_CNT);			
		}		
	}