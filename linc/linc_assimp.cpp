//hxcpp include should be first
#include <hxcpp.h>
#include "./linc_assimp.h"

namespace linc {

    namespace assimp {

        extern const aiScene* ReadFile(String path){
            Assimp::Importer importer;
            const aiScene* scene = importer.ReadFile(path.c_str(), aiProcess_Triangulate | aiProcess_FlipUVs | aiProcess_GenNormals);
            if(!scene || scene->mFlags & AI_SCENE_FLAGS_INCOMPLETE || !scene->mRootNode) 
            {
                printf("ERROR::ASSIMP:: %s \n", importer.GetErrorString());
                return 0;
            }
            return scene;
        }

    } //assimp namespace

} //linc