<?php
	
	//Because this is a controller, use the app\controllers namespace
	namespace app\controllers;
	
	//Tell the controller about any models we may need
	
	use app\models\Forms;
	//Ensure our controller inherits the \lithium\action\Controller class
	class FormsController extends \lithium\action\Controller {
		
		protected function _init() {
			$this->_render['negotiate'] = true;
			parent::_init();
		}
		
		//Define a default 'index' for when a user accesses the /posts/ URL
		public function index() {
			$myPosts = Forms::find('all');
			
			//Send the $my_posts object to our view
			return compact("myPosts",$myPosts);
		}
		
		public function add() {
			//Assume save status is false
			$saved = false;
			//If we have any posted or querystring data...
			if($this->request->data){
				//Use the MyPost model to create a new dataset
				$my_post = Forms::create($this->request->data);
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
				$my_post = Forms::create($array);
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
		
		public function getAllForms() {
			
			$myPosts = Forms::find('all');
			$userData=array();
			$userData["status"]=true;
			$userData["message"]="success";
			echo json_encode($myPosts->to('array'));
			
			exit;
			
		}
		
		public function editData() {
			$object=json_decode($this->request->data);
			$array =  (array) $object;
			//Use the MyPost model to create a new dataset
			//  $my_post = Forms::create($array);
			
			//Attempt to fetch the specified post
			$myPost = Forms::find($array['id']);
			
			//if the post couldn't be fetched, redirect to index
			if (!$myPost) {
				$userData=array();
				$userData["status"]=true;
				$userData["message"]="false";
				//Return $saved to our view as part of an associative array/token
				echo json_encode($userData); 
				exit;
			}
			
			//If we have post data, attempt to save
			if (($array) && $myPost->save($array)) {
				$userData=array();
				$userData["status"]=true;
				$userData["message"]="success";
				//Return $saved to our view as part of an associative array/token
				echo json_encode($userData); 
				exit;
			}
			
			exit;
		}	
		
		public function deleteForm() {
			print_r($this->request->args[0]);
			//Dont run the query if no post id is provided
			if($this->request->args[0]){
				//Find matching posts, then delete them
				$myPost = Forms::find($this->request->args[0])->delete();
				//Send the retrieved post data to the view
              	$userData=array();
				$userData["status"]=true;
				$userData["message"]="success";
				//Return $saved to our view as part of an associative array/token
				echo json_encode($userData); 
				exit;
			}
		}
		
	}
?>