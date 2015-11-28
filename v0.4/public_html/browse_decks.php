<?php

require_once("config.php");

try {
    $decks = Deck::getDecks();
    $config['smarty']->assign('decks', $decks);
    $config['smarty']->display('deck/browse_decks.tpl');
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}

?>