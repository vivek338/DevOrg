<aura:application >
<div class="slds-form-element">
    <label class="slds-form-element__label" for="my-multi-select">Multi Select!!</label>
    <div class="slds-form-element__control">
        <c:MultiSelect aura:id="my-multi-select" options="{!v.myOptions}" selectChange="{!c.handleSelectChangeEvent}" selectedItems="{!v.mySelectedItems}" />
    </div>
</div>	
</aura:application>