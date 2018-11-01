package assimp;
import cpp.RawConstPointer;
import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import cpp.Float32;

@:keep
@:include('linc_assimp.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('assimp'))
#end
extern class Assimp {
    @:native('linc::assimp::ReadFile')
    static function ReadFile(path:String) : AiScene;
} //Assimp


@:keep
@:include('linc_assimp.h')
@:native('aiScene')
private extern class AiI{ }

@:keep
@:include('linc_assimp.h')
@:native('aiScene')
private extern class AiS{ }

@:keep
@:include('linc_assimp.h')
@:native('aiNode')
private extern class AiN{ }

@:keep
@:include('linc_assimp.h')
@:native('aiMesh')
private extern class AiM{ }

@:keep
@:include('linc_assimp.h')
@:native('aiFace')
private extern class AiF{ }


@:keep
@:include('linc_assimp.h')
@:native('Assimp::Importer')
extern class AImporter{ }

abstract Importer(RawPointer<AImporter>) from RawPointer<AImporter> to RawPointer<AImporter>{
    public inline function new(){
        this = untyped __cpp__("new Assimp::Importer()");
    }

    public inline function ReadFile(path:String):AiScene{
        return untyped __cpp__("{0}->ReadFile({1}.c_str(), aiProcess_Triangulate | aiProcess_FlipUVs | aiProcess_GenNormals)", this, path);
    }

    public inline function dispose(){
        untyped __cpp__("delete {0}", this);
    }
}

abstract AiScene(RawConstPointer<AiS>) from RawConstPointer<AiS> to RawConstPointer<AiS>{
    public var mNumMeshes(get, never):Int;
    public inline function new(ptr:RawConstPointer<AiS>){
        this = ptr;
    }

    inline function get_mNumMeshes():UInt{
        return untyped __cpp__("{0}->mNumMeshes", this);
    }

    public inline function getMesh(idx:UInt):AiMesh{
        return untyped __cpp__("{0}->mMeshes[{1}]", this, idx);
    }

    public inline function getRootNode():AiNode{
        return untyped __cpp__("{0}->mRootNode", this);
    }

    public inline function destroy(){
        untyped __cpp__("delete {0}", this);
    }
}


abstract AiNode(RawPointer<AiN>) from RawPointer<AiN> to RawPointer<AiN>{
    public var mNumMeshes(get, never):Int;
    public var mNumChildren(get, never):Int;

    inline function get_mNumMeshes():UInt{
        return untyped __cpp__("{0}->mNumMeshes", this);
    }

    inline function get_mNumChildren():UInt{
        return untyped __cpp__("{0}->mNumChildren", this);
    }

    public inline function getMesh(idx:UInt):UInt{
        return untyped __cpp__("{0}->mMeshes[{1}]", this, idx);
    }

    public inline function getChild(idx:UInt):AiNode{
        return untyped __cpp__("{0}->mChildren[{1}]", this, idx);
    }

    public inline function destroy(){
        untyped __cpp__("delete {0}", this);
    }
}

abstract AiFace(RawPointer<AiF>) from RawPointer<AiF> to RawPointer<AiF>{
    public var mNumIndices(get, never):Int;

    inline function get_mNumIndices():UInt{
        return untyped __cpp__("{0}->mNumIndices", this);
    }

    public inline function getIndex(idx:UInt):UInt{
        return untyped __cpp__("{0}->mIndices[{1}]", this, idx);
    }

    public inline function destroy(){
        untyped __cpp__("delete {0}", this);
    }
}

abstract AiMesh(RawPointer<AiM>) from RawPointer<AiM> to RawPointer<AiM>{
    public var mNumVertices(get, never):Int;
    public var mNumFaces(get, never):Int;
    public var mMaterialIndex(get, never):Int;

    inline function get_mNumVertices():UInt{
        return untyped __cpp__("{0}->mNumVertices", this);
    }

    inline function get_mNumFaces():UInt{
        return untyped __cpp__("{0}->mNumFaces", this);
    }

    inline function get_mMaterialIndex():UInt{
        return untyped __cpp__("{0}->mMaterialIndex", this);
    }

    public inline function getFace(idx:UInt):AiFace{
        return untyped __cpp__("&({0}->mFaces[{1}])", this, idx);
    }

    public inline function getTextureCoords(idx:UInt):glm.Vec2{
        var out = new glm.Vec2();
        var data:Array<Float32> = [0,0];
        untyped __cpp__("{2}[0] = {0}->mTextureCoords[0][{1}].x", this, idx, data);
        untyped __cpp__("{2}[1] = {0}->mTextureCoords[0][{1}].y", this, idx, data);
        out.x = data[0];
        out.y = data[1];
        return out;
    }

    public inline function getNormals(idx:UInt):glm.Vec3{
        var out = new glm.Vec3();
        var data:Array<Float32> = [0,0,0];
        untyped __cpp__("{2}[0] = {0}->mNormals[{1}].x", this, idx, data);
        untyped __cpp__("{2}[1] = {0}->mNormals[{1}].y", this, idx, data);
        untyped __cpp__("{2}[2] = {0}->mNormals[{1}].z", this, idx, data);
        out.x = data[0];
        out.y = data[1];
        out.z = data[2];
        return out;
    }
    
    public inline function getBitangents(idx:UInt):glm.Vec3{
        var out = new glm.Vec3();
        var data:Array<Float32> = [0,0,0];
        untyped __cpp__("{2}[0] = {0}->mBitangents[{1}].x", this, idx, data);
        untyped __cpp__("{2}[1] = {0}->mBitangents[{1}].y", this, idx, data);
        untyped __cpp__("{2}[2] = {0}->mBitangents[{1}].z", this, idx, data);
        out.x = data[0];
        out.y = data[1];
        out.z = data[2];
        return out;
    }
    
    public inline function getTangents(idx:UInt):glm.Vec3{
        var out = new glm.Vec3();
        var data:Array<Float32> = [0,0,0];
        untyped __cpp__("{2}[0] = {0}->mTangents[{1}].x", this, idx, data);
        untyped __cpp__("{2}[1] = {0}->mTangents[{1}].y", this, idx, data);
        untyped __cpp__("{2}[2] = {0}->mTangents[{1}].z", this, idx, data);
        out.x = data[0];
        out.y = data[1];
        out.z = data[2];
        return out;
    }

    public inline function getVertex(idx:UInt):glm.Vec3{
        var out = new glm.Vec3();
        var data:Array<Float32> = [0,0,0];
        untyped __cpp__("{2}[0] = {0}->mVertices[{1}].x", this, idx, data);
        untyped __cpp__("{2}[1] = {0}->mVertices[{1}].y", this, idx, data);
        untyped __cpp__("{2}[2] = {0}->mVertices[{1}].z", this, idx, data);
        out.x = data[0];
        out.y = data[1];
        out.z = data[2];
        return out;
    }

    public inline function destroy(){
        untyped __cpp__("delete {0}", this);
    }
}