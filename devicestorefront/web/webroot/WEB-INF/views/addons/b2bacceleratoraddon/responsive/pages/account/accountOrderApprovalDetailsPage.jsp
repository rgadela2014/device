<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="b2b-order" tagdir="/WEB-INF/tags/addons/b2bacceleratoraddon/responsive/order" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%-- The Reject Button --%>

<div class="disable-link">
    <spring:url value="/my-account/order/approvalDecision" var="orderApprovalDecisionURL" htmlEscape="false" />
    <b2b-order:rejectOrderAction />
</div>

<%-- Replenishment Info --%>
<c:if test="${orderApprovalData.b2bOrderData.triggerData ne null}">
    <div class="margin-bottom-25">
        <b2b-order:orderApprovalReplenishmentDetails triggerData="${orderApprovalData.b2bOrderData.triggerData}" />
    </div>
</c:if>

<%-- Quotes Activity --%>
<c:if test="${not empty orderApprovalData.quotesApprovalHistoryEntriesData}">
    <div class="margin-bottom-25">
        <div class="quote-header pre-table no-margin-top">
            <spring:theme code="text.quotes.negotiationActivity.label" />
        </div>
        <b2b-order:quoteNegotiationActivity orderHistoryEntries="${orderApprovalData.quotesApprovalHistoryEntriesData}"/>
    </div>
</c:if>

<%-- Customer Approvals --%>
<c:if test="${not empty orderApprovalData.orderHistoryEntriesData}">
    <div class="margin-bottom-25">
        <div class="customer-approval-comments">
            <b2b-order:orderHistoryEntriesDetailsItem orderHistoryEntries="${orderApprovalData.orderHistoryEntriesData}"
                itemHolderTitleKey="text.account.orderHistoryEntry.customerTitle" />
        </div>
    </div>
</c:if>

<%-- Merchant Approvals --%>
<c:if test="${not empty orderApprovalData.merchantApprovalHistoryEntriesData}">
    <div class="margin-bottom-25">
        <b2b-order:orderHistoryEntriesDetailsItem orderHistoryEntries="${orderApprovalData.merchantApprovalHistoryEntriesData}"
            itemHolderTitleKey="text.account.orderHistoryEntry.merchantTitle" />
    </div>
</c:if>
