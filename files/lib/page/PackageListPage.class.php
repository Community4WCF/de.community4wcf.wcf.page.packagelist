<?php
// wcf imports
require_once(WCF_DIR.'lib/page/SortablePage.class.php');

/**
 * Shows a list of all installed packages.
 * 
 * @author		Marcel Werk , modified by "see package.xml"
 * @copyright	2001-2011 WoltLab GmbH
 * @license		GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @category 	Community Framework
 * @package		de.community4wcf.wcf.page.packagelist
 * @svn			$Id: PackageListPage.class.php 1758 2011-02-09 13:52:00Z TobiasH87 $
 */
class PackageListPage extends SortablePage {
	public $packages = array();
	public $templateName = 'packageList';
	public $itemsPerPage = PACKAGELIST_ITEMS_PER_PAGE;
	public $defaultSortField = 'packageType';
	public $defaultSortOrder = 'DESC';
	
	/**
	 * @see Page::assignVariables()
	 */
	public function readData() {
		parent::readData();
		
		$this->readPackages();
	}
	
	/**
	 * @see Page::assignVariables()
	 */
	public function assignVariables() {
		parent::assignVariables();
		
		WCF::getTPL()->assign(array('packages' => $this->packages,'allowSpidersToIndexThisPage' => ALLOW_SPIDER_ON_PACKAGELIST));
	}
	
	/**
	 * @see Page::show()
	 */
	public function show() {		
		// set active menu item
		require_once(WCF_DIR.'lib/page/util/menu/PageMenu.class.php');
		PageMenu::setActiveMenuItem('wcf.header.menu.packagelist');
		
		// check permission
		WCF::getUser()->checkPermission('user.managepages.canViewPackageList');

		// check module options
		if (!MODULE_PACKAGELIST) {
			throw new IllegalLinkException();
		}
		
		parent::show();
	}
	
	/**
	 * @see SortablePage::validateSortField()
	 */
	public function validateSortField() {
		parent::validateSortField();
		
		switch ($this->sortField) {
			case 'packageID':
			case 'package':
			case 'packageDir':
			case 'packageName':
			case 'instanceNo':
			case 'packageDescription':
			case 'packageVersion':
			case 'packageDate':
			case 'packageURL':
			case 'parentPackageID':
			case 'isUnique':
			case 'standalone':
			case 'author':
			case 'authorURL':
			case 'installDate':
			case 'updateDate': break;
			default: $this->sortField = $this->defaultSortField;
		}
	}
	
	/**
	 * @see MultipleLinkPage::countItems()
	 */
	public function countItems() {
		parent::countItems();
		
		$sql = "SELECT	COUNT(*) AS count
			FROM	wcf".WCF_N."_package";
		$row = WCF::getDB()->getFirstRow($sql);
		return $row['count'];
	}
	
	/**
	 * Gets all packages sorted by type and name.
	 */
	protected function readPackages() {
		if ($this->items) {
			try {
				$sql = "SELECT		package.*, CASE WHEN parentPackageID > 0 THEN 1 ELSE 0 END AS plugin,
							CASE WHEN instanceName <> '' THEN instanceName ELSE packageName END AS packageName
					FROM		wcf".WCF_N."_package package
					ORDER BY	".($this->sortField == 'packageType' ? 'standalone '.$this->sortOrder.', plugin '.$this->sortOrder : $this->sortField.' '.$this->sortOrder)
							.($this->sortField != 'packageName' ? ', packageName ASC' : '');
				$result = WCF::getDB()->sendQuery($sql, $this->itemsPerPage, ($this->pageNo - 1) * $this->itemsPerPage);
				while ($row = WCF::getDB()->fetchArray($result)) {
					$this->packages[] = $row;
				}
			}
			catch (DatabaseException $e) {
				// horizon update workaround
				$sql = "SELECT		package.*, CASE WHEN parentPackageID > 0 THEN 1 ELSE 0 END AS plugin
					FROM		wcf".WCF_N."_package package
					ORDER BY	".($this->sortField == 'packageType' ? 'standalone '.$this->sortOrder.', plugin '.$this->sortOrder : $this->sortField.' '.$this->sortOrder)
							.($this->sortField != 'packageName' ? ', packageName ASC' : '');
				$result = WCF::getDB()->sendQuery($sql, $this->itemsPerPage, ($this->pageNo - 1) * $this->itemsPerPage);
				while ($row = WCF::getDB()->fetchArray($result)) {
					$this->packages[] = $row;
				}
			}
		}
	}
}
?>