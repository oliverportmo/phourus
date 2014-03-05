<?php 

class qUserTest extends PHPUnit_Framework_TestCase
{
	
	# user
	public function testuser(){
  	// 'string'
		$user_id= '3';
		$query= sprintf("SELECT * FROM `%s` WHERE id = %d;", TABLE_USERS, $user_id);
		$this->assertEquals($query, qUser::user($user_id));
		
		// array
		$params= array();
		$params['id']= 4;
		$query= sprintf("SELECT * FROM `%s` WHERE id = %d;", TABLE_USERS, $params['id']);
		$this->assertEquals($query, qUser::user($params));
		
		// int
		$user_id= 4;
		$query= sprintf("SELECT * FROM `%s` WHERE id = %d;", TABLE_USERS, $user_id);
		$this->assertEquals($query, qUser::user($user_id));	
		
		// array()
		$user_id= array();
		$query= sprintf("SELECT * FROM `%s` WHERE id = %d;", TABLE_USERS, $user_id);
		$this->assertEquals($query, qUser::user($user_id));
	}

	# posts
	public function testposts(){
    $user_id= 6;
    $query= sprintf("SELECT type, COUNT(type) AS total FROM `%s` WHERE user_id = %d GROUP BY `type`;", TABLE_POSTS, $user_id);
	}
	
  # notifications
	public function notifications(){
    /*$user_id = $params['user_id'];
    isset($params['limit']) ? $limit = $params['limit'] : $limit = 20;
    isset($params['page']) ? $page = $params['page'] : $page = 0;
    $offset = $page * $limit;
    $favorites = '1,3,4';
    
    $query = "SELECT user_id, target_id, created, type FROM (";
    
    /** POSTS **
    // thumbs
    $fields = TABLE_THUMBS.".user_id AS user_id, ".TABLE_POSTS.".id AS target_id, ".TABLE_THUMBS.".created AS created, 'thumb' AS type";
    $query.= "SELECT $fields FROM `".TABLE_POSTS."` INNER JOIN `".TABLE_THUMBS."` ON ".TABLE_POSTS.".id = ".TABLE_THUMBS.".post_id WHERE ".TABLE_POSTS.".user_id = $user_id UNION ";   

    // comments
    $fields = TABLE_COMMENTS.".user_id AS user_id, ".TABLE_POSTS.".id AS target_id, ".TABLE_COMMENTS.".created AS created, 'comment' AS type";
    $query.= "SELECT $fields FROM `".TABLE_POSTS."` INNER JOIN `".TABLE_COMMENTS."` ON ".TABLE_POSTS.".id = ".TABLE_COMMENTS.".post_id WHERE ".TABLE_POSTS.".user_id = $user_id UNION ";
      
    // posts
    $fields = TABLE_POSTS.".user_id AS user_id, ".TABLE_POSTS.".id AS target_id, ".TABLE_POSTS.".created AS created, 'post' AS type";
    $query.= "SELECT $fields FROM `".TABLE_POSTS."` WHERE ".TABLE_POSTS.".user_id IN($favorites) UNION ";

    /** USERS **
    // favorites
    $fields = TABLE_FAVORITES.".user_id AS user_id, ".TABLE_FAVORITES.".target_id AS target_id, ".TABLE_FAVORITES.".created AS created, 'favorite' AS type";
    $query.= "SELECT $fields FROM `".TABLE_FAVORITES."` WHERE ".TABLE_FAVORITES.".target_id = $user_id UNION ";
    
    // profile views
    $fields = TABLE_VIEWS.".user_id AS user_id, ".TABLE_VIEWS.".user_id AS target_id, ".TABLE_VIEWS.".created AS created, 'view' AS type";
    $query.= "SELECT $fields FROM `".TABLE_VIEWS."` WHERE ".TABLE_VIEWS.".user_id = $user_id";

    /** ORGS **
    // accept
    
    
    $query.= ") AS x ORDER BY created DESC LIMIT $offset, $limit;";
    return $query;*/
	}	
}

?>