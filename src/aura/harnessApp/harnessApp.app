<aura:application >
    <c:helloWorld />
    <aura:attribute name="value1" type="string" default="Hello.." />
    <aura:attribute name="value2" type="string" default="Vivek.." />
    <br></br>
    {!v.value1} {!v.value2}
    
    <aura:attribute name="edit" type="boolean" default="false" />
    
    
    <aura:if isTrue="{!v.edit}">
        <ui:button label="submit" />
        
        <aura:set attribute="else">
        	hi deepika
        </aura:set>
    </aura:if>
    <aura:attribute name="first" type="list" />
    
    
    <ui:button label="getNumber" press="{!getNumber}" />
    <aura:iteration var="num" items="{!v.first}">
    	{!num.value}
    </aura:iteration>
    
    
	
</aura:application>