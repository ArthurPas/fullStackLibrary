import "./_hero-banner.scss";

/**
 * @component HeroBanner - Display the hero banner of the home page
 * 
 * @returns {JSX.Element} - The HeroBanner component
 * 
 * @example <HeroBanner/>
 */
function HeroBanner() {
	return (
		<div className="hero__banner">
			<h2>The library of your dreams.</h2>
			<h3>
				The Bookshelf is an online library, borrow and share books,<br/>
				stories, and new wonderful worlds.
			</h3>
		</div>
	);
}

export default HeroBanner;
