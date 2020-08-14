<a href="/my_posts/">Return to Index</a>
<?=$this->form->create(); ?>
    <?=$this->form->field('title',array('value'=>$myPost->title)); ?>
    <?=$this->form->field('body',
        array('type'=>'textarea','value'=>$myPost->body)); ?>
    <?=$this->form->submit('Edit Post'); ?>
<?=$this->form->end(); ?>