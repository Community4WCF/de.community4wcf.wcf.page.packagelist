{include file="documentHeader"}
<head>
	<title>{lang}wcf.packagelist.title{/lang} - {lang}{PAGE_TITLE}{/lang}</title>
	{include file='headInclude' sandbox=false}
	<script type="text/javascript" src="{@RELATIVE_WCF_DIR}js/MultiPagesLinks.class.js"></script>
</head>
<body{if $templateName|isset} id="tpl{$templateName|ucfirst}"{/if}>
{include file='header' sandbox=false}

<div id="main">
	<ul class="breadCrumbs">
		<li><a href="index.php?page=Index{@SID_ARG_2ND}"><img src="{icon}indexS.png{/icon}" alt="" /> <span>{lang}{PAGE_TITLE}{/lang}</span></a> &raquo;</li>
	</ul>

	<div class="mainHeadline">
		<img src="{icon}packageL.png{/icon}" alt="" />
		<div class="headlineContainer">
			<h2>{lang}wcf.packagelist.title{/lang}</h2>
			<p>{lang}wcf.packagelist.description{/lang}</p>
		</div>
	</div>
	
	{if $userMessages|isset}{@$userMessages}{/if}
	
	{if $additionalTopContents|isset}{@$additionalTopContents}{/if}

	<div class="contentHeader">
		{pages print=true assign=pagesLinks link="index.php?page=PackageList&pageNo=%d&sortField=$sortField&sortOrder=$sortOrder&packageID="|concat:PACKAGE_ID:SID_ARG_2ND_NOT_ENCODED}
	</div>

	{if $packages|count > 0}
		<div class="border titleBarPanel">
			<div class="containerHead"><h3>{lang}wcf.packagelist.list.count{/lang}</h3></div>
		</div>
		<div class="border borderMarginRemove">
			<table class="tableList">
				<thead>
					<tr class="tableHead">
						<th colspan="2"{if $sortField == 'packageID'} class="active"{/if}><div><a href="index.php?page=PackageList&amp;pageNo={@$pageNo}&amp;sortField=packageID&amp;sortOrder={if $sortField == 'packageID' && $sortOrder == 'ASC'}DESC{else}ASC{/if}&amp;packageID={@PACKAGE_ID}{@SID_ARG_2ND}">{lang}wcf.packagelist.list.id{/lang}{if $sortField == 'packageID'} <img src="{icon}sort{@$sortOrder}S.png{/icon}" alt="" />{/if}</a></div></th>
						<th{if $sortField == 'packageName'} class="active"{/if}><div><a href="index.php?page=PackageList&amp;pageNo={@$pageNo}&amp;sortField=packageName&amp;sortOrder={if $sortField == 'packageName' && $sortOrder == 'ASC'}DESC{else}ASC{/if}&amp;packageID={@PACKAGE_ID}{@SID_ARG_2ND}">{lang}wcf.packagelist.list.name{/lang}{if $sortField == 'packageName'} <img src="{icon}sort{@$sortOrder}S.png{/icon}" alt="" />{/if}</a></div></th>
						{if PACKAGELIST_ENABLE_PACKAGE}<th{if $sortField == 'package'} class="active"{/if}><div><a href="index.php?page=PackageList&amp;pageNo={@$pageNo}&amp;sortField=package&amp;sortOrder={if $sortField == 'package' && $sortOrder == 'ASC'}DESC{else}ASC{/if}&amp;packageID={@PACKAGE_ID}{@SID_ARG_2ND}">{lang}wcf.packagelist.list.identifier{/lang}{if $sortField == 'package'} <img src="{icon}sort{@$sortOrder}S.png{/icon}" alt="" />{/if}</a></div></th>{/if}
						<th{if $sortField == 'author'} class="active"{/if}><div><a href="index.php?page=PackageList&amp;pageNo={@$pageNo}&amp;sortField=author&amp;sortOrder={if $sortField == 'author' && $sortOrder == 'ASC'}DESC{else}ASC{/if}&amp;packageID={@PACKAGE_ID}{@SID_ARG_2ND}">{lang}wcf.packagelist.list.author{/lang}{if $sortField == 'author'} <img src="{icon}sort{@$sortOrder}S.png{/icon}" alt="" />{/if}</a></div></th>
						{if PACKAGELIST_ENABLE_PACKAGEURL}<th{if $sortField == 'packageURL'} class="active"{/if}><div><a href="index.php?page=PackageList&amp;pageNo={@$pageNo}&amp;sortField=packageURL&amp;sortOrder={if $sortField == 'packageURL' && $sortOrder == 'ASC'}DESC{else}ASC{/if}&amp;packageID={@PACKAGE_ID}{@SID_ARG_2ND}">{lang}wcf.packagelist.list.url{/lang}{if $sortField == 'packageURL'} <img src="{icon}sort{@$sortOrder}S.png{/icon}" alt="" />{/if}</a></div></th>{/if}
						{if PACKAGELIST_ENABLE_PACKAGEDESCRIPTION}<th{if $sortField == 'packageDescription'} class="active"{/if}><div><a href="index.php?page=PackageList&amp;pageNo={@$pageNo}&amp;sortField=packageDescription&amp;sortOrder={if $sortField == 'packageDescription' && $sortOrder == 'ASC'}DESC{else}ASC{/if}&amp;packageID={@PACKAGE_ID}{@SID_ARG_2ND}">{lang}wcf.packagelist.list.packageDescription{/lang}{if $sortField == 'packageDescription'} <img src="{icon}sort{@$sortOrder}S.png{/icon}" alt="" />{/if}</a></div></th>{/if}
						{if PACKAGELIST_ENABLE_PACKAGEVERSION}<th{if $sortField == 'packageVersion'} class="active"{/if}><div><a href="index.php?page=PackageList&amp;pageNo={@$pageNo}&amp;sortField=packageVersion&amp;sortOrder={if $sortField == 'packageVersion' && $sortOrder == 'ASC'}DESC{else}ASC{/if}&amp;packageID={@PACKAGE_ID}{@SID_ARG_2ND}">{lang}wcf.packagelist.list.version{/lang}{if $sortField == 'packageVersion'} <img src="{icon}sort{@$sortOrder}S.png{/icon}" alt="" />{/if}</a></div></th>{/if}
						{if PACKAGELIST_ENABLE_PACKAGEDATE}<th{if $sortField == 'packageDate'} class="active"{/if}><div><a href="index.php?page=PackageList&amp;pageNo={@$pageNo}&amp;sortField=packageDate&amp;sortOrder={if $sortField == 'packageDate' && $sortOrder == 'ASC'}DESC{else}ASC{/if}&amp;packageID={@PACKAGE_ID}{@SID_ARG_2ND}">{lang}wcf.packagelist.list.date{/lang}{if $sortField == 'packageDate'} <img src="{icon}sort{@$sortOrder}S.png{/icon}" alt="" />{/if}</a></div></th>{/if}
					
						{if $additionalColumns|isset}{@$additionalColumns}{/if}
					</tr>
				</thead>
				<tbody>
					{foreach from=$packages item=$package}
						<tr class="{cycle values="container-1,container-2"}">
							<td class="columnID">{@$package.packageID}</td>
							<td class="columnIcon">
								{if $package.standalone}
									<img src="{icon}packageTypeStandaloneS.png{/icon}" alt="" title="{lang}wcf.packagelist.list.standalone{/lang}" />
								{elseif $package.plugin}
									<img src="{icon}packageTypePluginS.png{/icon}" alt="" title="{lang}wcf.packagelist.list.plugin{/lang}" />
								{else}
									<img src="{icon}packageS.png{/icon}" alt="" title="{lang}wcf.packagelist.list.other{/lang}" />
								{/if}
							</td>
							<td class="columnText" title="{$package.packageDescription} ({$package.package})" id="packageName{@$package.packageID}"><span>{$package.packageName}{if $package.instanceNo > 1 && $package.instanceName == ''} (#{#$package.instanceNo}){/if}</span></td>
							{if PACKAGELIST_ENABLE_PACKAGE}<td class="columnText">{$package.package}</td>{/if}
							<td class="columnText">{if $package.authorURL}<a href="{@RELATIVE_WCF_DIR}acp/dereferrer.php?url={$package.authorURL|rawurlencode}" class="externalURL">{$package.author}</a>{else}{$package.author}{/if}</td>
							{if PACKAGELIST_ENABLE_PACKAGEURL}<td class="columnText">{if $package.packageURL}<a href="{@RELATIVE_WCF_DIR}acp/dereferrer.php?url={$package.packageURL|rawurlencode}" class="externalURL">{$package.packageURL}</a>{/if}</td>{/if}
							{if PACKAGELIST_ENABLE_PACKAGEDESCRIPTION}<td class="columnText">{@$package.packageDescription}</td>{/if}
							{if PACKAGELIST_ENABLE_PACKAGEVERSION}<td class="columnText">{$package.packageVersion}</td>{/if}
							{if PACKAGELIST_ENABLE_PACKAGEDATE}<td class="columnDate">{@$package.packageDate|date}</td>{/if}
						
							{if $package.additionalColumns|isset}{@$package.additionalColumns}{/if}
						</tr>
					{/foreach}
				</tbody>
			</table>
		</div>
	{/if}

	<div class="contentFooter">
		{@$pagesLinks}
	</div>

	{if $additionalBottomContents|isset}{@$additionalBottomContents}{/if}
</div>

{include file='footer' sandbox=false}
</body>
</html>