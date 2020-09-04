<?php
	
	//Because this is a controller, use the app\controllers namespace
	namespace app\controllers;
	
	//Tell the controller about any models we may need
	
	use app\models\Leads;
	use app\models\Professionals;
	use PHPMailer\PHPMailer\PHPMailer;
	use PHPMailer\PHPMailer\Exception;
	
	require 'PHPMailer/src/Exception.php';
	require 'PHPMailer/src/PHPMailer.php';
	require 'PHPMailer/src/SMTP.php';
	//Ensure our controller inherits the \lithium\action\Controller class
	class LeadsController extends \lithium\action\Controller {
		
		protected function _init() {
			$this->_render['negotiate'] = true;
			parent::_init();
		}
		
		//Define a default 'index' for when a user accesses the /posts/ URL
		public function index() {
			$myPosts = Services::find('all');
			
			//Send the $my_posts object to our view
			return compact("myPosts",$myPosts);
		}
		
		public function add() {
			//Assume save status is false
			$saved = false;
			//If we have any posted or querystring data...
			if($this->request->data){
				//Use the MyPost model to create a new dataset
				$my_post = MyPosts::create($this->request->data);
				//Attempt to save the data, and update the $saved variable
				//with the outcome of the save attempt (bool)
				$saved = $my_post->save();
			}
			//Return $saved to our view as part of an associative array/token
			return compact('saved');
		}
		public function addData() {
			
			//Assume save status is false
			$saved = false; 
			//If we have any posted or querystring data...
			if($this->request->data){
				$object=json_decode($this->request->data);
				$array =  (array) $object;
				$ans=json_decode($array['answers_json']);
				$ansarray =  (array) $ans;
				$password=$array["password"];
				$name=$ansarray['name'];
				$email=$ansarray['email'];
				$phone=$ansarray['phoneNumber'];
				
				$ans1=$ansarray['whoIsSeekingToRecoverTheDebt']; 
				$ans2=$ansarray['whatIsTheAmountOwed'];
				$ans3=$ansarray['howLongHasThisAmountBeenUnpaidFor'];
				$ans4=$ansarray['doYouAlreadyHaveACourtJudgementForThisDebt'];
				$ans5=$ansarray['whichOfTheFollowingDoesTheDebtRelateTo'];
				
				
			  	$myEmails = Professionals::find('all');
				
				$emails='';
				$chk=1;
				foreach($myEmails as $key=>$val){
					if($chk==1){
						$emails.=$val->email_address;
						}else{
						$emails.=','.$val->email_address;
					}
					$chk++;
				}
				
				$mail = new PHPMailer(true);
				
				$data=array();
				
				//$email ='nadeem.eway@gmail.com'; 
				//$email ="'".$emails."'"; 
				$subject="🔔 ".$name." is looking for Debt Collectors nationwide"; 
				$body2 = '<div style="background-color:#f4f4f4;margin:0!important;padding:0!important"><table width="100%" cellspacing="0" cellpadding="0" border="0"> <tbody> <tr> <td bgcolor="#f4f4f4" align="center"> <table width="600" cellspacing="0" cellpadding="0" border="0"> <tbody><tr> <td style="padding:10px 30px;color:#31708f;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px;border-bottom:1px solid #bce8f1" valign="top" align="center"><h2>Find A Collector</h2> </td></tr></tbody></table> </td></tr><tr> <td style="padding:0px 10px 0px 10px" bgcolor="#f4f4f4" align="center"> <table width="600" cellspacing="0" cellpadding="0" border="0"> <tbody> <tr> <td style="padding:10px 30px;color:#31708f;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px;border-bottom:1px solid #bce8f1" bgcolor="#d9edf7" align="left"> <p style="margin:0">New Customer Alert </p></td></tr><tr> <td style="padding:20px 30px;color:#61696d;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px" bgcolor="#ffffff" align="left"> <table width="100%" cellspacing="0" cellpadding="0" border="0" align="center"> <tbody><tr> <td style="font-size:0" valign="top" align="left"> <div style="display:block;vertical-align:top;width:100%;margin-bottom:20px"> <table cellspacing="0" cellpadding="0" border="0" align="left"> <tbody><tr> <td style="color:#3a4449;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:30px" align="left">'.$name.' needs a Debt Collector</td></tr></tbody></table> </div></td></tr><tr> <td style="font-size:0" valign="top" align="left"> <div style="display:inline-block;max-width:310px;vertical-align:top;width:100%;margin-bottom:20px"> <table width="100%" cellspacing="0" cellpadding="0" border="0" align="left"> <tbody><tr> <td style="padding:0px 0 0"> <table width="100%" cellspacing="0" cellpadding="0" border="0"> <tbody><tr> <td style="color:#61696d;font-family:Lato,Helvetica,Arial,sans-serif;font-size:16px;font-weight:400;line-height:30px;padding:0 0 3px" align="left"><img src="https://ci3.googleusercontent.com/proxy/YEbBZO9qW-Az2kSAXx4wBi8XVa7meg2fn81MRl3MVfrO4_qUPgqjdJhcku8lVg94cDC77XVPeeKKWI4qSASfskJL2AjuJ2ALN54vfASv3xG1GELC35bDc0_l1QE=s0-d-e1-ft#https://d1w7gvu0kpf6fl.cloudfront.net/img/email/icons/location-marker.png" style="margin-left:2px;margin-right:11px;vertical-align:middle" alt="Location" class="CToWUd" width="12" height="16">Nationwide<br><div style="font-size:13px;color:#a4a4a4;padding-left:28px">Happy to receive service online or remotely</div></td></tr><tr> <td style="color:#61696d;font-family:Lato,Helvetica,Arial,sans-serif;font-size:16px;font-weight:400;line-height:30px;padding:0 0 3px" align="left"><table cellspacing="0" cellpadding="0" border="0"> <tbody><tr> <td style="color:#61696d;font-family:Lato,Helvetica,Arial,sans-serif;font-size:16px;font-weight:400;line-height:30px"><img src="https://ci6.googleusercontent.com/proxy/9aHvnXxvJwdmB0sVEWZX-tMJNjAeI_th2-SR5kCEyj0J3ZRDj66h32LNyl1akCov9S9hn-NnVUG9GSEDr9UKQIWJlVWzTMTFupKPPzRJBPzPgw=s0-d-e1-ft#https://d1w7gvu0kpf6fl.cloudfront.net/img/email/icons/phone.png" style="margin-left:2px;margin-right:13px;vertical-align:middle" alt="Phone" class="CToWUd" width="14" height="14">'.$phone.'</td></tr></tbody></table></td></tr><tr> <td style="color:#61696d;font-family:Lato,Helvetica,Arial,sans-serif;font-size:16px;font-weight:400;line-height:30px;padding:0 0 3px" align="left"><img src="https://ci3.googleusercontent.com/proxy/zfN2dRM--4saJwux3hmvkcG2WE_cduyGl3oKmEThdsxFIvKKT7p_1Zl1Qf5fo1YOLOsgfHEqvtTR6SLPp6BPsLfjYnUSUg7td_DxKhVF-aBYqaIxYQ=s0-d-e1-ft#https://d1w7gvu0kpf6fl.cloudfront.net/img/email/icons/envelope.png" style="margin-left:2px;margin-right:6px;vertical-align:middle" alt="Email" class="CToWUd" width="16" height="12"> <a rel="nofollow" href="#m_3714675377581212005_m_7523736762318780640_m_-305990030591611917_" style="text-decoration:none;color:inherit">'.$email.'</a> </td></tr></tbody></table> </td></tr></tbody></table> </div></td></tr><tr> <td style="padding:0px 0px 0;color:#111111;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px" valign="middle" bgcolor="#ffffff" align="left"> <a href="https://ewayits.com/bark/sellers/leads" style="font-size:16px;font-family:Lato,Helvetica,Arial,sans-serif;color:#ffffff;text-decoration:none;color:#ffffff;text-decoration:none;border-radius:3px;padding:10px 15px;border:1px solid #48a7fe;display:block;text-align:center;background-color:#48a7fe" target="_blank" data-saferedirecturl=""> Contact '.$name.' Now </a> </td></tr><tr> <td style="text-align:center;padding:20px 0px 0;color:#888888;font-family:Lato,Helvetica,Arial,sans-serif;font-size:17px;font-weight:400;line-height:25px" bgcolor="#ffffff" align="left"> Let '.$name.' know you re interested and receive their contact details. </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr><tr> <td bgcolor="#f4f4f4" align="center"> <table width="600" height="20" cellspacing="0" cellpadding="0" border="0"> <tbody><tr> <td bgcolor="#f4f4f4" align="center"></td></tr></tbody></table> </td></tr><tr> <td style="padding:0px 10px 0px 10px" bgcolor="#f4f4f4" align="center"> <table width="600" cellspacing="0" cellpadding="0" border="0"> <tbody> <tr> <td style="padding:10px 30px;color:#31708f;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px;border-bottom:1px solid #bce8f1" bgcolor="#d9edf7" align="left"> <p style="margin:0">Project Details </p></td></tr><tr> <td style="padding:20px 30px;color:#61696d;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px" bgcolor="#ffffff" align="left"> <table width="100%" cellspacing="0" cellpadding="0" border="0" align="center"> <tbody><tr> <td style="padding:0px 0px 0;color:#61696d;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px" bgcolor="#ffffff" align="left"> <p style="margin:0">Who is seeking to recover the debt?</p></td></tr><tr> <td style="padding:5px 0px 20px;color:#3a4449;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:bold;line-height:25px" bgcolor="#ffffff" align="left"> <p style="margin:0">'.$ans1.'</p></td></tr><tr> <td style="padding:0px 0px 0;color:#61696d;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px" bgcolor="#ffffff" align="left"> <p style="margin:0">What is the amount owed?</p></td></tr><tr> <td style="padding:5px 0px 20px;color:#3a4449;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:bold;line-height:25px" bgcolor="#ffffff" align="left"> <p style="margin:0">'.$ans2.'</p></td></tr><tr> <td style="padding:0px 0px 0;color:#61696d;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px" bgcolor="#ffffff" align="left"> <p style="margin:0">How long has this amount been unpaid for?</p></td></tr><tr> <td style="padding:5px 0px 20px;color:#3a4449;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:bold;line-height:25px" bgcolor="#ffffff" align="left"> <p style="margin:0">'.$ans3.'</p></td></tr><tr> <td style="padding:0px 0px 0;color:#61696d;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px" bgcolor="#ffffff" align="left"> <p style="margin:0">Do you already have a court judgement for this debt?</p></td></tr><tr> <td style="padding:5px 0px 20px;color:#3a4449;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:bold;line-height:25px" bgcolor="#ffffff" align="left"> <p style="margin:0">'.$ans4.'</p></td></tr><tr> <td style="padding:0px 0px 0;color:#61696d;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px" bgcolor="#ffffff" align="left"> <p style="margin:0">Which of the following does the debt relate to?</p></td></tr><tr> <td style="padding:5px 0px 20px;color:#3a4449;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:bold;line-height:25px" bgcolor="#ffffff" align="left"> <p style="margin:0">'.$ans5.'</p></td></tr><tr> <td style="padding:0px 0px 0;color:#61696d;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px" bgcolor="#ffffff" align="left"> <p style="margin:0">Additional Details</p></td></tr><tr> <td style="padding:5px 0px 20px;color:#3a4449;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:bold;line-height:25px" bgcolor="#ffffff" align="left"> <p style="margin:0">unpaid loan</p></td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr><tr> <td style="padding:0px 10px 0px 10px" bgcolor="#f4f4f4" align="center"> <table width="600" cellspacing="0" cellpadding="0" border="0"> <tbody> <tr> <td style="padding:10px 30px;color:#31708f;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px;border-bottom:1px solid #bce8f1" bgcolor="#d9edf7" align="left"> <p style="margin:0">Estimated Value </p></td></tr><tr> <td style="padding:20px 30px;color:#61696d;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px" bgcolor="#ffffff" align="left"> <table width="100%" cellspacing="0" cellpadding="0" border="0" align="center"> <tbody><tr> <td style="padding:0px 0px 0;color:#61696d;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px" bgcolor="#ffffff" align="left"> <p style="margin:0">Based on quotes from other Bark professionals to similar requests, we estimate the following price guide:</p></td></tr><tr> <td style="padding:20px 0px 0;color:#3a4449;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:bold;line-height:25px" bgcolor="#ffffff" align="left"> <p style="margin:0">Most customers spent between: £40 - £250 </p></td></tr><tr> <td style="padding:20px 0px 0;color:#3a4449;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:bold;line-height:25px" bgcolor="#ffffff" align="left"> <p style="margin:0">Premium services may be more than: £1800 </p></td></tr><tr> <td style="padding:20px 0px 0;color:#61696d;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px" bgcolor="#ffffff" align="left"> <p style="margin:0">This has not been shared with the customer.</p></td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr><tr> <td style="padding:0px 10px 0px 10px" bgcolor="#f4f4f4" align="center"> <table width="600" cellspacing="0" cellpadding="0" border="0"> <tbody><tr> <td style="padding:0px 30px 30px;color:#111111;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px" bgcolor="#ffffff" align="left"> <a href="https://ewayits.com/bark/sellers/leads" style="font-size:16px;font-family:Lato,Helvetica,Arial,sans-serif;color:#ffffff;text-decoration:none;color:#ffffff;text-decoration:none;border-radius:3px;padding:10px 15px;border:1px solid #48a7fe;display:inline-block;background-color:#48a7fe" target="_blank" data-saferedirecturl="">Contact '.$name.' Now</a> </td></tr></tbody> </table> </td></tr><tr> <td bgcolor="#f4f4f4" align="center"> <table width="600" height="20" cellspacing="0" cellpadding="0" border="0"> <tbody><tr> <td bgcolor="#f4f4f4" align="center"></td></tr></tbody></table> </td></tr><tr> <td style="padding:0px 10px 0px 10px" bgcolor="#f4f4f4" align="center"> <table width="600" cellspacing="0" cellpadding="0" border="0"> <tbody> <tr> <td style="padding:10px 30px;color:#31708f;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px;border-bottom:1px solid #bce8f1" bgcolor="#d9edf7" align="left"> <p style="margin:0">How do I get started? </p></td></tr><tr> <td style="padding:20px 30px;color:#61696d;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px" bgcolor="#ffffff" align="left"> <table width="100%" cellspacing="0" cellpadding="0" border="0" align="center"> <tbody> <tr> <td style="padding:10px 0px 0;color:#61696d;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px" bgcolor="#ffffff" align="left"> <p style="margin:0"> To contact '.$name.' you’ll need to buy credits. </p></td></tr><tr> <td style="padding:20px 0px 0;color:#61696d;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px" bgcolor="#ffffff" align="left"> <p style="margin:0"> We offer a discounted starter pack with enough credits for about 10 responses, backed by our Get Hired Guarantee. </p></td></tr><tr> <td style="padding:20px 0px 0;color:#61696d;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px" bgcolor="#ffffff" align="left"> <p style="margin:0"> We’re so confident you’ll get hired at least once from your starter pack, that if you don’t we’ll give you all your credits back. </p></td></tr><tr> <td style="padding:20px 0px 0;color:#111111;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px" bgcolor="#ffffff" align="left"> <a href="https://ewayits.com/bark/sellers/leads" style="font-size:16px;font-family:Lato,Helvetica,Arial,sans-serif;color:#ffffff;text-decoration:none;color:#ffffff;text-decoration:none;border-radius:3px;padding:10px 15px;border:1px solid #48a7fe;display:inline-block;background-color:#48a7fe" target="_blank" data-saferedirecturl="">Contact '.$name.' Now</a> </td></tr><tr> <td style="padding:20px 0px 0;color:#61696d;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px" bgcolor="#ffffff" align="left"> <p style="margin:0">If you have any questions, please call <a style="color:#3eaefc" href="tel:+442036970237" target="_blank">020 3697 0237</a> (open 24 hours a day, 7 days a week) or email <a href="mailto:team@bark.com" style="color:#48a7fe;text-decoration:underline" target="_blank">team@bark.com</a> and we will be happy to help.</p></td></tr><tr> <td style="padding:30px 0px 0px;color:#61696d;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px" bgcolor="#ffffff" align="left"> <p style="margin:0">Kind regards,</p></td></tr><tr> <td style="padding:10px 0px 30px;color:#3a4449;font-family:Lato,Helvetica,Arial,sans-serif;font-size:18px;font-weight:400;line-height:25px;font-style:italic" bgcolor="#ffffff" align="left"> <p style="margin:0">The Bark Team</p></td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr><tr> <td style="padding:0px 10px 0px 10px" bgcolor="#f4f4f4" align="center"> <table width="600" cellspacing="0" cellpadding="0" border="0"><tbody> <tr> <td style="padding:15px 30px 5px;color:#666666;font-family:Lato,Helvetica,Arial,sans-serif;font-size:14px;font-weight:400;line-height:18px" bgcolor="#f4f4f4" align="center"> <p style="margin:0">Manage your email preferences <a href="" style="color:#3a4449;font-weight:700" target="_blank" data-saferedirecturl="">here</a>.</p></td></tr><tr> <td style="padding:0px 30px 30px 30px;color:#666666;font-family:Lato,Helvetica,Arial,sans-serif;font-size:14px;font-weight:400;line-height:18px" bgcolor="#f4f4f4" align="center"> <p style="margin:0"><a style="color:#3eaefc" href="" target="_blank" data-saferedirecturl="">Bark.com</a> 2020 | International House, 24 Holborn Viaduct, London, EC1A 2BN</p></td></tr></tbody> </table> </td></tr></tbody> </table></div>';
				
				$msg = nl2br("Verification E-mail Sent To Your Account.");
				try {
					//Server settings
					$mail->SMTPDebug = 0;                               // Enable verbose debug output
					$mail->isSMTP();                                    // Set mailer to use SMTP
					$mail->Host       = 'ewayits.com';			// Specify main and backup SMTP servers
					$mail->SMTPAuth   = true;                           // Enable SMTP authentication
					$mail->Username   = 'test@ewayits.com';                  
					$mail->Password   = '6T%zz{I(^L$,';                         
					$mail->SMTPSecure = 'tls';                          // tls		ssl     
					$mail->Port       = 587;  							// 587 		465
					$mail->CharSet="windows-1251";
					$mail->CharSet="utf-8";
					$mail->SetFrom('test@ewayits.com', 'Find A Collector Team'); 
					$mail->isHTML(true);                                    // Set email format to HTML
					//$mail->addAddress($email);     							// Add a recipient
					$addresses = explode(',', $emails);                
					foreach ($addresses as $address) {
						
						$mail->addAddress($address);
					}
					$mail->Subject = $subject;  
					$mail->Body    = $body2;	
					
					if($mail->Send()) {
						
						$data = array ("success" => true, "msg" => $msg);
						} else {
						
						echo $mail->ErrorInfo;
						$data = array ("success" => false, "msg" => $mail->ErrorInfo ); 
					}
					
					} catch (Exception $e) {
					echo $mail->ErrorInfo;
					$data = array ("success" => false, "msg" => "Message could not be sent. Mailer Error: {$mail->ErrorInfo}" );
				}
				
				//Use the MyPost model to create a new dataset
				$my_post = Leads::create($array);
				//Attempt to save the data, and update the $saved variable
				//with the outcome of the save attempt (bool)
				$saved = $my_post->save();
			}
			
			
			$mail = new PHPMailer(true);
			
			$data=array();
			
			//$email ='nadeem.eway@gmail.com'; 
			//$email ="'".$emails."'"; 
			$subject="🔔 ".$name." Your Lead is Ready."; 
			$body2 ="<p>Email : ".$email."</p><p>Password :  ".$password."</p>";
			
			
			$msg = nl2br("Verification E-mail Sent To Your Account.");
			try {
				//Server settings
				$mail->SMTPDebug = 0;                               // Enable verbose debug output
				$mail->isSMTP();                                    // Set mailer to use SMTP
				$mail->Host       = 'ewayits.com';			// Specify main and backup SMTP servers
				$mail->SMTPAuth   = true;                           // Enable SMTP authentication
				$mail->Username   = 'test@ewayits.com';                  
				$mail->Password   = '6T%zz{I(^L$,';                         
				$mail->SMTPSecure = 'tls';                          // tls		ssl     
				$mail->Port       = 587;  							// 587 		465
				$mail->CharSet="windows-1251";
				$mail->CharSet="utf-8";
				$mail->SetFrom('test@ewayits.com', 'Find A Collector Team'); 
				$mail->isHTML(true);                                    // Set email format to HTML
				//$mail->addAddress($email);     							// Add a recipient
				
				$mail->addAddress($email);
				
				$mail->Subject = $subject;  
				$mail->Body    = $body2;	
				
				if($mail->Send()) {
					
					$data = array ("success" => true, "msg" => $msg);
					} else {
					
					echo $mail->ErrorInfo;
					$data = array ("success" => false, "msg" => $mail->ErrorInfo ); 
				}
				
				} catch (Exception $e) {
				echo $mail->ErrorInfo;
				$data = array ("success" => false, "msg" => "Message could not be sent. Mailer Error: {$mail->ErrorInfo}" );
			}
			
			$userData=array();
			$userData["status"]=true;
			$userData["message"]="success";
			//Return $saved to our view as part of an associative array/token
			echo json_encode($userData); 
			exit;
		}
		public function getAllLeads() {
			
			$myPosts = Leads::find('all');
			$userData=array();
			$userData["status"]=true;
			$userData["message"]="success";
			echo json_encode($myPosts->to('array'));
			
			exit;
			
		}
		public function getData() {
			
			$myPosts = Services::find('all');
			$userData=array();
			$userData["status"]=true;
			$userData["message"]="success";
			echo json_encode($myPosts->to('array'));
			
			$posts=array();
			foreach($myPosts as $key=>$val){
				
				$posts[$key]["id"]=$val->id;
				$posts[$key]["title"]=$val->title;
				$posts[$key]["body"]=$val->body;
				
			}
			
			$userData["data"]=$posts;
			// echo json_encode($userData); 
			exit;
		}
		
		public function view() {
			//Dont run the query if no post id is provided
			if($this->request->args[0]){
				//Get single record from the database where post id matches the URL
				$myPost = MyPosts::first($this->request->args[0]);
				//Send the retrieved post data to the view
				return compact('myPost');
			}
			//since no post id was specified, redirect to the index page
			$this->redirect(array('MyPosts::index'));
		}
		
		public function delete() {
			//Dont run the query if no post id is provided
			if($this->request->args[0]){
				//Find matching posts, then delete them
				$myPost = MyPosts::find($this->request->args[0])->delete();
				//Send the retrieved post data to the view
				$this->redirect( array('MyPosts::index' ) );
			}
		}
		
		public function edit() {
			
			//Attempt to fetch the specified post
			$myPost = MyPosts::find($this->request->args[0]);
			
			//if the post couldn't be fetched, redirect to index
			if (!$myPost) {
				$this->redirect('MyPosts::index');
			}
			
			//If we have post data, attempt to save
			if (($this->request->data) && $myPost->save($this->request->data)) {
				//If save was successful, redirect to the new post
				$this->redirect( array(
				'MyPosts::view', 
				'args' => array($myPost->id)
				));
			}
			
			//If we haven't been redirected, then send the post info to the view
			return compact('myPost');
		}
	}
	
?>