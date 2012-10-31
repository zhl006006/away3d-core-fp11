package away3d.animators.states
{
	import away3d.animators.data.ParticleRenderParameter;
	import away3d.animators.nodes.ParticleCircleLocalNode;
	import away3d.animators.nodes.ParticleNodeBase;
	import away3d.animators.ParticleAnimator;
	import flash.display3D.Context3DVertexBufferFormat;
	/**
	 * ...
	 */
	public class ParticleCircleLocalState extends ParticleStateBase
	{
		private var circleNode:ParticleCircleLocalNode;
		
		public function ParticleCircleLocalState(animator:ParticleAnimator, particleNode:ParticleNodeBase)
		{
			super(animator, particleNode);
			circleNode = particleNode as ParticleCircleLocalNode;
		}
		
		override public function setRenderState(parameter:ParticleRenderParameter) : void
		{
			var index:int = parameter.activatedCompiler.getRegisterIndex(particleNode, ParticleCircleLocalNode.CIRCLE_STREAM_REGISTER);
			parameter.streamManager.activateVertexBuffer(index, parameter.streamManager.getNodeDataOffset(particleNode), parameter.stage3DProxy, Context3DVertexBufferFormat.FLOAT_3);
			
			index = parameter.activatedCompiler.getRegisterIndex(particleNode, ParticleCircleLocalNode.EULERS_CONSTANT_REGISTER);
			parameter.activatedCompiler.setVertexConstFromMatrix(index, circleNode.eulersMatrix);
		}
	}

}