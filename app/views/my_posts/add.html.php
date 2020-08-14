<!--Generate the opening form tag-->
<?=$this->form->create(); ?>
    <!--Generate a text field for "title"-->
    <?=$this->form->field('title');?>
    <!--Generate a textarea field for body content-->
    <?=$this->form->field('body',array('type'=>'textarea'));?>
    <!--Generate the submit button-->
    <?=$this->form->submit('Add Post');?>
<!--Generate the closing form tag-->
<?=$this->form->end();?>

<?php if($saved): ?>
<h4>Data saved successfully!</h4>
<?php endif; ?>