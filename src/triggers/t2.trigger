trigger t2 on Opportunity (before insert, before update) {
    trigger_class.trigger_method(trigger.new);

}