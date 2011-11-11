# Assignee Search for Ticketing Systems

This is a generic search system developed to help determine where certain support tickets should be routed, based on the tags associated with each "assignee" (department/group/etc.) and their position description. The user will enter a query string (IE: "employee password reset"), and the system will run a tag-search, along with a fulltext query of the description. The assignees filtered by this query will be returned to the user via an AJAX call, which the user can select to receive the full description.



* Authentication and User Identification using LDAP
* Comments for Assignees
* The Ability to modify descriptions (along with track modifications)
* Precaching for the kth most commonly searched phrases

Planned Features:
* An item in a bulleted (unordered) list
    * A subitem, indented with 4 spaces
* Another item in a bulleted list
