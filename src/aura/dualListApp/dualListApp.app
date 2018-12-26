<aura:application extends="force:slds">
    <!-- search term -->
    <aura:attribute name="term" type="String" />
    <!-- currently displayed items -->
    <aura:attribute name="options" type="List" default="[]" />
    <!-- all items -->
    <aura:attribute name="allOptions" type="List" default="[]" />
    <!-- selected values -->
    <aura:attribute name="selected" type="List" default="[]" />

    <!-- load data from somewhere -->
    <aura:handler name="init" value="{!this}" action="{!c.init}" />
    <!-- update list when term changes -->
    <aura:handler name="change" value="{!v.term}" action="{!c.search}" />

    <lightning:input type="text" value="{!v.term}" label="Filter" />
    <lightning:dualListbox value="{!v.selected}" options="{!v.options}" label="Items"
                           sourceLabel="Available" selectedLabel="Selected" />
    
   <c:dualListCmp />   
</aura:application>