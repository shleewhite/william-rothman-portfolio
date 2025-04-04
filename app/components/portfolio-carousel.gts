import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import { on } from '@ember/modifier';
import { gt, and, lt } from 'ember-truth-helpers';

const ALT_TEXT = [
  'Project 1: Tapestry (personal, design for scale, ideation, prototyping). Project 2: Glampercrate (personal/professional, entrepreneurship, human centered design, manufacturability). Project 3: Right Up™ 270 (professional, upspeccing existing products, trend forecasting, engineering). Project 4: Overhang™ 400 (professional, design for manufacturability, market research, business finance).',
  'Project 1: Tapestry. A system of interior cladding allowing for the replacement of paneling, easy mounting of appliances, access to plumbing and electrical systems, and interior decoration. Team: Will Rothman (designer researcher, strategist). 2 3D renderings of rooms with wooden or grey paneling. There are mini-split, lights, bookshelves, and desks mounted to the paneling.',
  'The problem. What: A system for interior wall cladding which allows easy replacement of paneling and mounting accessories. Why: Tapestry is an exploration into drywall alternatives- born from the frustration of living in a small space and not having the ability to move outlets around like one would any other kind of furniture. Once it became clear that this concept had potential to maximize floorspace, it became hard not to see every appliance or piece of furniture as wall-mountable- dehumidifiers, desks, lighting, even beds could attach to the wall. As living spaces become smaller, the line between product design and architecture will blur. Mass housing production loses the localization and customization afforded to old-style, on-site, stick-built construction. Is there a way that customization can be reintroduced to a mass-produced product? How: This product is still the development stage and has not experienced user testing beyond my workshop. As for implementation, in theory, the target market would be prefab construction, where technicians can install studs inlaid with L-track and benefit from efficiencies gained during installation. Inspiration for the construction of homes with exposed studs comes from the Perfect Wall concept by Rauser Designs, in which a house is built with all insulation and enveloping construction on the exterior of the frame. Pencil sketches of furniture mounted to the wall and panels attaching to L-track.',
  "Ideation. Can a solution be... as modular as Dieter Rams' Vitsoe? As easy to use as French cleats? As intuitive as a suspension rail? As structural as a beam hanger? More recyclable than drywall? As replaceable as exterior cladding? As aesthetically pleasing as wainscoting?",
  "Systems. The first step in realizing this product is deciding the best framework for anchoring accessories. Several systems were considered with an eye toward modularity and strength. Wireframe: The initial concept was a wireframe cage lining the perimeter of the room with panels clipping on for easy removal. This system did not allow easy access to the area behind the mesh for plumbing and electrical work to be done. Pencil sketches of a wire frame around a room. L-track: while working in campervan conversion, I encountered L-track used to create mounting points for ceiling cargo hooks and perimeter cabinetry. The bars of extruded and machined aluminum rail paired with fitting system. It's used primarily for cargo tie-downs and securing modular aircraft seating. Mass produced, recyclable, relatively inexpensive, with a shear force of over a ton and simple geometry, L-track has potential to be a platform for a range of wall-mounted accessories. E-track: E-track was also considered for it's low cost, availability, and ease of use, but the mechanics of attachment and release mechanism do not provide enough tolerance for mounting larger objects. Like L-track, its primary use is found securing cargo.",
  'Attachment. Because the track would be oriented vertically, the fittings can be designed for single-direction with the confidence that gravity would keep them in place. This meant that a single fitting would be stable without a locking mechanism. I used Autodesk Fusion 360 to model the components before 3D printing them in PLA. Prototype 1: initial design relied on a 90° radial sweep in the shape of the cutout to wedge fitting into track. This design required too much angular motion to lock, impractical for larger accessories, and provided only marginal stability. The geometry of the track would not allow for a full hook and a level protrusion simultaneously. Prototype 2: I then realized the orientation of the cutouts on the track as a series of partially interlinked circles. This simple design allowed the fitting to slide in and down easily and offered sufficient support. Prototype 3: Finally, I raised a spine to minimize lateral travel and serve as a base for a diverse range of accessories.',
  "Accessories. What from here: And what should be wall-mounted? It's more of a question of what belongs on the floor and what doesn't. Once the possibility of opening up floor space becomes a reality, there's no limit to what can become a floating feature. With a sheer force of over 2,000 pounds, possibilities of using it as a structural mount furniture such as Murphy beds, appliances such as fans and air purifiers, and even heavier architectural features such as beams start to become feasible. Could a lofted floor become a DIY project? Example modular room accessories: bookshelf, minisplit, sconces, desk/table, outlet. Shelf brackets designed to support a strip of plywood between two columns of L-track, printed and mounted in my office.",
  'Project 2: Glampercrate. Can the comforts of a campervan be downspecced into a car camping crate to reach more would-be glampers? Team: Will Rothman (designer, researcher, strategist)',
  "Brand context. The goal of the Glampercrate was to expand the total available market for the campervan conversion company, Glampervan. The company had been around since 2016 and had made a name for itself among customers and van builders alike for its pleasing and well thought-out design. My task was to take that momentum and launch something new. Glampervan design strengths: CNCed maple plywood interiors for durability and crafted aesthetic, self-contained unit water and power, easily accessible for maintenance, modular cabinetry built to maximize small interior space. Glampervan system strengths: prefabricated assembly methods utilizing existing assembly line kanban systems, iterative design process centered around user testing, highly experienced and collaborative team of carpenters, electrician, and plumbers, the spirit of innovation and a companywide passion for facilitating new experiences. Modularity and a new style of ownership: The crate was philosophically different than the van. What ideals were unfamiliar to the company thus far and how could we learn to think outside of our current designs? These points served as a framework for development: design products which fits the customer's lifestyle, not an identity they have to buy into, allow the customer to maintain vehicle utility, let the customer decide when and how to use the product, value maintained through ownership (no miles, technology can be updated), equipment (utility) > property, loan it to a friend without a second thought.",
  "Personas. Allie - age: 28, location: Oakland, CA, occupation: tech marketing, salary: $115k/year, living arrangements: 3BR house with 2 roommates. Allie structures her life around the outdoors. Weekends and holidays are all spent at the foot of a mountain or at a remote swimming hole. She has a lifted SUV and isn't willing to sacrifice its maneuverability on dirt roads and cities for more space. Still, she wants to upgrade her setup from a tent on the ground or a mattress in her trunk. Yon - age: 36, location: Reno, NV, occupation: caterer, salary: $70k/year, living arrangements: 1BR flat with a wife, 4yo child and dog. Yon is a small time caterer and uses his hatchback to transport hundreds of desserts from his kitchen to the venues. He wants a van for his business but can't afford one and isn't willing to give up his hauling functionality for a camper build-out. He can't throw a mattress in the back of his car for car camping because the back seats need to stay up for his son's carseat.",
  'Build: pencil drawings of a crate, prototype built with CNCed plywood with a simple sink, water storage, and table.  Prototype developed with wood and accessories around the shop, used to gauge dimensions for compartments and as a visual aid for the pitch meeting. CAD renders: models built in Fusion 360 for design improvements and eventual exporting to 2D for CNCing. The slidign teeth of the bed platform were intended for a future prototype.',
  "Specs & costing. Electrical: an auxiliary power source is great for charging phones and lighting a campsite. I chose Renogy battery, inverter, and charge controller setup for maximum modularity so the customer can add solar power. Run-time was a question, but after talking to many experience car campers, 50 amp-hours is enough charge for a weekend trip. The box would allowo space for upgrades. Water: while camping, it's advised a person drinks at least one gallon per day. I settled on 5 gallons because it's an industry standard size and enough for 3 days plus cooking and extra. Pumps can break and it sucks to have to pour from a top-spout jerry can when that happens - a simple spigot works fine for most applications. Labor: Estimates based on man-hours used to build similar structures in vans at an average wage of $25/hour.",
  'Project 3: Right Up™ 270. Right Up™ 270 is a platform hitch bike rack capable of handling the weight of two average-weight ebikes. Team: Will Rothman (product manager), Randy Cardona (Sr. Industrial Designer), Tad Osada (Sr. Developer), Vivien Mak (Project manager), Ivan Kwok (engineer).',
  'Research. Electric bicycles: the new reality: Elecric bicycles are the new reality. Coming out of the first years of the pandemic, electric bicycle adoption had skyrocketed and we, a cycling accessoreies manufacturer, were trying to get a handle on market vacancies. In a design meeting, I broke down the process of buying an ebike to see if there were any opportunities for attachment purchases. For the most part, many ebike makers had proprietary accessories which cost more than a mass user would be willing to pay. Since this was a new market for Bell, we were not willing to go all in on ebikes - any product we made for ebikes would have to be compatible with analog bikes. Most of our products could technically work on an ebike, my goal was to look for significant deltas between ebikes and analog bikes. Bells ebike initiative: a logo was created to embody our push into ebikes. We hoped to not only provide good, mass-accessible products, but solve the issue of communicating to ebike owners that our products would work on their bikes. Room for growth: our biggest gap in the ecosystem was portage. We had 2-bike and 3-bike platform racks which could carry at max one 35LB bike in each slot. Every other in-store rack on the market was over $600 and the cheapest 2-up rack we could find online was $499. Nobody was making a rack at a mass retail price point. And this brought up another question, how was a customer supposed to buy an ebike in-store and drive it home?',
  "Specs. Defining the target: while some ebike companies use factory OEM parts, like brake pads and chains, manufactured by factories developing bicycle accessories, many of them feature proprietary parts, like electrical components and seats. In addition to these complex and unique BOMs, many ebikes differ in frame geometry and weight. There is an image of a spreadsheet comparing features, average bike weight, and distribution channels. The final product, 2-up bike rack. Hitch: of the two standard hitch dimensions, 1.25in and 2in, 2in was a safer bet for supporting 2x ebikes (140lbs) + rack (50lbs). We opted for a stabilizing bolt to minimize wiggle, but removed further dampening features in order to keep cost down. Rack: platform racks are ideal for supporting heavier objects, as their low center of gravity and proximity to mounting point allow for more efficient reinforcement of cargo. Attachment: adjustable arm clamps down on bicycle top tube. Folds down for access to trunk. Troughs accomodate wheels up to 4in width, 16-29in diameter, and adjusts to fit velcro straps lessen risk of bike shifting. Structure: central beam folds up when not in use. Structural steel fins are welded to the underside of the arms to support the increased weight. Hiccups in go-to-market: one of the greatest difficulties in getting this product to market was that it didn't fit the existing pricing strategy. The 2-bike rack in Bells line had a $150 MSRP and the 3-bike rack had a $200 MSRP. Cost and shipping for the product was just shy of $80/each, so order to make a reasonable margin (30%), this rack would have to be $266. I developed the name Righ UP 270 to stick within the 2-bike hitch rack 200s naming convention, but also to signal that the rack carried 2 bikes of 70lbs each.",
  'Project 4: Overhang™ 400. The Overhang™ 400 is a tailgate pad designed at Bell Sports for the purpose of transporting two bicycles in the bed of a pickup truck. Team: Will Rothman (product manager), Randy Cardona (Sr. Industrial Designer), Tad Osada (Sr. Developer), Vivien Mak (Project manager), Ivan Kwok (engineer), Dave Ellison (packaging designer).',
  'Research. Everything is trucked: Tailgate pads were a growing product segment in bike portage, running parallel to the pickup truck fad starting in the late 2010s. Competition: I began the process by researching competitors and assembling a matrix of features, retail prices, and dimensions. The companies making the pads on the market were specialty mountain bike companies with their own design language focusing on supportive cushioning, sleek designs, and radical graphics. Research led to a tiered of feature importance, critical for developing a brief. Gate dimensions: I assembled truck tailgate dimensions from all popular makes and models in order to define specs. I then outlined the minimum product requirements with the Sr. Developer on the team, coordinated an RFP to manufacturers, and worked backwards from ideal retail price to get target cost (FOB). Max Depth: 6in, Min Depth: 3in,  Edge-to-Handle width Max: 30in, Edge-to-Handle width Min: 23in, Tailgate Height Max: 26in, Tailgate Height Min: 16in. Product requirements. Need to have: straps for securing 2 bikes, protective padding, durable, weather resistant outer material, soft underside, adjustable connection to gate. Good to have: supportive padding to minimize lateral movement, multi-point tiedown for extra security, clear bell branding. Nice to have: pocket for storage, extra material flange for added coverage.',
  'Specs. With each round of samples, I performed extensive user testing with a variety of people, trucks, and bikes. We began wiht only a half pad, two buckled straps to secure the bikes, and two buckled straps to secure the pad to the gate. The first round minimum viable product came in at half our target budget and through the next 4 sample cycles, we were able to add more premium features. PVC fabric exterior: durable outer fabric withstands impact from bicycles, outdoor conditions, and sun exposure. User interviews taught us people tend to leave pads attached. Microfiber lining: soft, low-pile interior ensures minimal abrasion from fully-tightened pad. Reflective logo: capitalizing on the rear-facing billboard space to provide some branding. Securing straps: woven nylon straps wrap around the tailgate, utilizing a buckle for easy tightening. Ends are cut at 45° angle for easier insertion. Sewn-in creases: thick foam required seams to be sewn in compressing the material and communicating fold lines.',
  'Specs. Hook and loop straps: we discussed using more expensive 2-sided hook & loop, but in user testing found that it was more likely to come off the pad. 1/2in dense PE foam padding: thick polyethylene, enough to withstand repeated impacts from bicycle bottom tubes, forks, and occasional stray hub-tooth. Pocket: small pocket able to fit small tools, extra tubes, frame pumps, etc. Added after discovering room in budget.',
  'Packaging. Structure: Packaging this product was surprisingly complicated. The 22in width pad needed to be hung on a planogram (the retail pegboard) and was less likely to be accepted by retailers if they assessed it was not worth merchandising according to their metric of dollars per square inch. I worked with the packaging designer to figure out how to make the pad more compact. A foam pad, when folded, tended to apply pressure to its confines as it attempted to return to its natural shape. To counteract this, we tried a box, but the cardboard would deform as soon as it was inserted. We explored thicker boxes and rubber bands to hold the pad, but in the end, both were too expensive and we figured a way to wrap the nylon securing strap around a twice-folded pad, synching it tight. The labor cost of this process came in several cents bellow the alternatives. Customer interaction: The final box design obscured the pad—in order to convey plushness and durability, we included a cut-out for squeezing. Much of the goal of on-shelf packaging is to quickly communicate form and utility. The photo I chose for the front obscures the pad itself, but tells a story of how the product would be used and how it would improve the life of the buyer. The graphics on the side of the package were designed to communicate to the customer purpose and variety of use.',
];

export default class PortfolioCarousel extends Component {
  @tracked currentSlide = 1;
  @tracked secondSlide = 2;

  get currentSlideAltText(): string {
    return ALT_TEXT[this.currentSlide];
  }

  get secondSlideAltText(): string {
    return ALT_TEXT[this.secondSlide];
  }

  @action
  nextButtonPress() {
    if (this.currentSlide === 19) {
      this.currentSlide = 1;
      this.secondSlide = 2;
    } else {
      this.currentSlide += 1;
      this.secondSlide += 1;
    }
  }

  @action previousButtonPress() {
    if (this.currentSlide === 1) {
      this.currentSlide = 19;
      this.secondSlide = 20;
    } else {
      this.currentSlide -= 1;
      this.secondSlide -= 1;
    }
  }

  <template>
    <div class='carousel-container'>
      <div class='carousel-media'>
        <img
          src='/portfolio-parts/{{this.currentSlide}}.png'
          alt={{this.currentSlideAltText}}
        />
        {{#if (and (gt this.currentSlide 1) (lt this.currentSlide 20))}}
          <img
            src='/portfolio-parts/{{this.secondSlide}}.png'
            alt={{this.secondSlideAltText}}
          />
        {{/if}}
      </div>
      <div>
        <div class='carousel-button-container'>
          <button
            class='carousel-button'
            type='button'
            aria-label='Previous slide'
            {{on 'click' this.previousButtonPress}}
          >
            <svg
              width='24'
              height='24'
              viewBox='0 0 24 24'
              fill='none'
              xmlns='http://www.w3.org/2000/svg'
              stroke='#151515'
              stroke-width='2'
              stroke-linecap='round'
              stroke-linejoin='round'
              class='arrow-left'
            ><path d='M9 20L1 12L9 4' fill='none'></path><line
                x1='1'
                y1='12'
                x2='17'
                y2='12'
                fill='none'
              ></line></svg>
          </button>
          <button
            class='carousel-button'
            type='button'
            aria-label='Next slide'
            {{on 'click' this.nextButtonPress}}
          >
            <svg
              width='24'
              height='24'
              viewBox='0 0 24 24'
              fill='none'
              xmlns='http://www.w3.org/2000/svg'
              stroke='#151515'
              stroke-width='2'
              stroke-linecap='round'
              stroke-linejoin='round'
              class='arrow-right'
            ><path d='M15 20L23 12L15 4' fill='none'></path><line
                x1='1'
                y1='-1'
                x2='17'
                y2='-1'
                transform='matrix(-1 0 0 1 24 13)'
                fill='none'
              ></line></svg>
          </button>
        </div>
      </div>
    </div>
  </template>
}
