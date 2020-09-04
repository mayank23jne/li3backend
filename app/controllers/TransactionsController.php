<?php
	
	//Because this is a controller, use the app\controllers namespace
	namespace app\controllers;
	
	//Tell the controller about any models we may need
	use app\models\MyPosts;
	use app\models\Transactions;
	use PHPMailer\PHPMailer\PHPMailer;
	use PHPMailer\PHPMailer\Exception;
	
	require 'PHPMailer/src/Exception.php';
	require 'PHPMailer/src/PHPMailer.php';
	require 'PHPMailer/src/SMTP.php';
	//Ensure our controller inherits the \lithium\action\Controller class
	class TransactionsController extends \lithium\action\Controller {
		
		protected function _init() {
			$this->_render['negotiate'] = true;
			parent::_init();
		}
		
		//Define a default 'index' for when a user accesses the /posts/ URL
		public function index() {
			$myPosts = Transactions::find('all');
			
			//Send the $my_posts object to our view
			return compact("myPosts",$myPosts);
		}
		
		public function add() {
			$mail = new PHPMailer(true);
			$body2='';
			$data=array();
			$email ='nadeem.eway@gmail.com';
			$subject="🔔 Donna is looking for Debt Collectors nationwide"; 
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
				$mail->addAddress($email);     							// Add a recipient
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
			
			//Assume save status is false
			//If we have any posted or querystring data...
			if($this->request->data){
				//Use the MyPost model to create a new dataset
				$my_post = Transactions::create($this->request->data);
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
				
				//Use the MyPost model to create a new dataset
				$my_post = Transactions::create($array);
				//Attempt to save the data, and update the $saved variable
				//with the outcome of the save attempt (bool)
				$saved = $my_post->save();
			}
			$userData=array();
			$userData["status"]=true;
			$userData["message"]="success";
			//Return $saved to our view as part of an associative array/token
			echo json_encode($userData); 
			exit;
		}
		
		public function getData() {
			
			$myPosts = Transactions::find('all');
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