﻿import scaleform.clik.core.UIComponent;
import scaleform.clik.constants.InvalidationType;
import scaleform.clik.constants.ScrollBarDirection;
/**
 * The StatusIndicator component displays the status of an event or action using its timeline as the visual indicator. The value of the StatusIndicator will be interpolated with the minimum and maximum values to generate a frame number that will be played in the component’s timeline. Since the component’s timeline is used to display the status, it provides absolute freedom in creating innovative visual indicators.
 
    <b>Inspectable Properties</b>
    A MovieClip that derives from the StatusIndicator component will have the following inspectable properties:
    <ul>
        <li><i>enabled</i>: Disables the component if set to false.</li>
        <li><i>minimum</i>: The minimum value used to interpolate the target frame.</li>
        <li><i>maximum</i>: The maximum value used to interpolate the target frame.</li>
        <li><i>value</i>: The status value of an event or action. It is interpolated between the minimum and maximum values to generate a frame number to be played.</li>
        <li><i>visible</i>: Hides the component if set to false.</li>
    </ul>
    
    <b>States</b>
    There are no states for the StatusIndicator component. The component’s frames are used to display the status of an event or action. 
    
    <b>Events</b>
    All event callbacks receive a single Object parameter that contains relevant information about the event. The following properties are common to all events. <ul>
    <li><i>type</i>: The event type.</li>
    <li><i>target</i>: The target that generated the event.</li></ul>
        
    No special events are generated by the StatusIndicator. The properties listed next to the event are provided in addition to the common properties.<ul>
    <li><i>ComponentEvent.SHOW</i>: The visible property has been set to true at runtime.</li>
    <li><i>ComponentEvent.HIDE</i>: The visible property has been set to false at runtime.</li>
 */
intrinsic class scaleform.clik.controls.StatusIndicator extends UIComponent
{
	public var _maximum : Number;
	public var _minimum : Number;
	public var _value : Number;

	public function get maximum() : Number;
	public function set maximum(value:Number) : void;

	public function get minimum() : Number;
	public function set minimum(value:Number) : void;

	public function get value() : Number;
	public function set value(value:Number) : void;

	/**
         * The {@code value} of the {@code StatusIndicator}, to make it polymorphic with a {@link ScrollIndicator}.
         */
	public function get position() : Number;
	public function set position(value:Number) : void;


	public function StatusIndicator();

	public function initialize() : void;

	/** @exclude */
	public function toString() : String;

	public function configUI() : void;

	public function draw() : void;

	public function updatePosition() : void;

}