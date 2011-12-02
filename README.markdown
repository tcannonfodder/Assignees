# Assignee Search for Ticketing Systems

This is a generic search system developed to help determine where certain support tickets should be routed, based on the Tasks associated with each "assignee" (department/group/etc.), the contacts associated with each assignee, and the assignee's description. The user will enter a query string (IE: "employee password reset"), and the system will run a search in the tasks and contacts, along with a fulltext query of the description. The assignees filtered by this query will be returned to the user.

##Planned Features:
* The Ability to modify descriptions (along with track modifications)
* Pagination (currently investigating)